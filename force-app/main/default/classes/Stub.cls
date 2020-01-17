@IsTest
public class Stub implements System.StubProvider {
    public with sharing class UnsupportedMethodException extends Exception {
        private UnsupportedMethodException(
            final String methodName,
            final Type returnType,
            final List<Type> parameterTypes,
            final List<String> parameterNames
        ) {
            final List<Stub.Parameter> parameters = new List<Stub.Parameter>();
            final Integer size = parameterTypes.size();
            for (Integer i = 0; i < size; i++) {
                parameters.add(new Stub.Parameter(parameterTypes[i], parameterNames[i]));
            }

            this
                .setMessage(
                    String.format(
                        'No {0} found in getHandleableMethods() matching signature: {1}',
                        new List<String>{
                            Stub.Method.class.getName(),
                            Stub.getSignature(
                                void.class,
                                returnType,
                                methodName,
                                parameters
                            )
                        }
                    )
                );
        }
    }

    public with sharing class NullInstanceTypeException extends Exception {
    }
    public with sharing class InvalidParameterTypeException extends Exception {
    }
    public with sharing class InvalidParameterNameException extends Exception {
    }
    public with sharing class NullParameterException extends Exception {
    }
    public with sharing class MethodException extends Exception {
    }

    private final List<Stub.Method> actualMethodsCalled;
    private final List<Stub.Method> expectedMethodsCalled;
    private final Set<Stub.Method> handleableMethods;

    public Stub(List<Stub.Method> expectedMethodsCalled) {
        this.actualMethodsCalled = new List<Stub.Method>();
        this.expectedMethodsCalled = expectedMethodsCalled;

        this.handleableMethods = new Set<Stub.Method>();
        if (this.expectedMethodsCalled != null) {
            for (Stub.Method method : this.expectedMethodsCalled) {
                if (method != null) {
                    this.handleableMethods.add(method);
                }
            }
        }
    }

    public List<Stub.Method> getExpectedMethodsCalled() {
        return new List<Stub.Method>(this.expectedMethodsCalled);
    }

    public List<Stub.Method> getActualMethodsCalled() {
        return new List<Stub.Method>(this.actualMethodsCalled);
    }

    public Set<Stub.Method> getHandleableMethods() {
        return new Set<Stub.Method>(this.handleableMethods);
    }

    public void assertMethodsCalled() {
        System.assertEquals(
            this.expectedMethodsCalled,
            this.actualMethodsCalled,
            String.format(
                'Asserting {0} getExpectedMethodsCalled() equals {0} getActualMethodsCalled()',
                new List<String>{(List<Stub.Method>.class).getName()}
            )
        );
    }

    public Object handleMethodCall(
        Object instance,
        String methodName,
        Type returnType,
        List<Type> parameterTypes,
        List<String> parameterNames,
        List<Object> arguments
    ) {
        // Try to find a Stub.Method in handleableMethods that matches the signature for the arguments passed into this method.
        for (Stub.Method method : this.handleableMethods) {
            if (
                method.matchesSignature(instance, methodName, returnType, parameterTypes)
            ) {
                // Assert arguments equal the method's expected arguments.
                method.assertArgumentsEqualExpectedArguments(arguments);

                // Record/log this method was called.
                this.actualMethodsCalled.add(method);

                // Throw an Exception before returning method.getReturnValue() by calling method.setExceptionThrownBeforeReturningValue(...).
                if (method.isThrowingExceptionBeforeReturningValue()) {
                    throw method.getExceptionThrownBeforeReturningValue();
                }

                // If a test requires an Exception to be throw, throw the Exception in method's Object getReturnValue().
                return method.getReturnValue();
            }
        }

        // Throw an Exception because this.handleableMethods does not have a method that matches the signature for the arguments passed into this method.
        final Integer size = parameterTypes.size();
        final List<Stub.Parameter> parameters = new List<Stub.Parameter>(size);
        for (Integer i = 0; i < size; i++) {
            parameters[i] = new Stub.Parameter(parameterTypes[i], parameterNames[i]);
        }
        throw new Stub.UnsupportedMethodException(
            methodName,
            returnType,
            parameterTypes,
            parameterNames
        );
    }

    public class Parameter {
        final private Type type;
        final private String name;
        final private String signature;

        private Boolean assertArgumentHasExactEquality;

        private Parameter(
            Type type,
            String name,
            String typeDescription,
            String nameDescription
        ) {
            if (type == null) {
                throw new Stub.InvalidParameterTypeException(
                    String.format(
                        '{0}Type type cannot be null',
                        new List<String>{
                            String.isBlank(typeDescription) ? '' : typeDescription + ': '
                        }
                    )
                );
            }
            this.type = type;

            if (String.isBlank(name)) {
                throw new Stub.InvalidParameterNameException(
                    String.format(
                        '{0}String name cannot be blank',
                        new List<String>{
                            String.isBlank(nameDescription) ? '' : nameDescription + ': '
                        }
                    )
                );
            }
            this.name = name.trim();

            this.signature = this.getType().getName() + ' ' + this.getName();
        }

        public Parameter(Type type, String name, Boolean assertArgumentHasExactEquality) {
            this(type, name, (String) null, (String) null);
            this.setAssertArgumentHasExactEquality(assertArgumentHasExactEquality);
        }

        public Parameter(Type type, String name) {
            this(type, name, false);
        }

        public Type getType() {
            return this.type;
        }

        public String getName() {
            return this.name;
        }

        public String getSignature() {
            return this.signature;
        }

        public Boolean getAssertArgumentHasExactEquality() {
            return this.assertArgumentHasExactEquality;
        }

        public Stub.Parameter setAssertArgumentHasExactEquality(
            Boolean assertArgumentHasExactEquality
        ) {
            this.assertArgumentHasExactEquality = assertArgumentHasExactEquality == true;
            return this;
        }

        private void assertArgument(
            Object expected,
            Object actual,
            Integer index,
            Stub.Method method
        ) {
            if (this.getAssertArgumentHasExactEquality()) {
                System.assert(
                    expected === actual,
                    String.format(
                        'Expecting exact equality (===) for argument at index {0}: Stub.Parameter {1}; Stub.Method: {2}',
                        new List<String>{
                            String.valueOf(index),
                            this.getSignature(),
                            method.getSignature()
                        }
                    )
                );
            } else {
                System.assertEquals(
                    expected,
                    actual,
                    String.format(
                        'Unexpected argument at index {0}: Stub.Parameter {1}; Stub.Method: {2}',
                        new List<String>{
                            String.valueOf(index),
                            this.getSignature(),
                            method.getSignature()
                        }
                    )
                );
            }
        }

        public override String toString() {
            return this.getSignature();
        }

        public Integer hashCode() {
            return this.getSignature().hashCode();
        }

        public Boolean equals(Object parameter) {
            return parameter instanceof Stub.Parameter &&
                this.type.equals(((Stub.Parameter) parameter).type) &&
                this.name.equalsIgnoreCase(((Stub.Parameter) parameter).name);
        }
    }

    public abstract class Method implements Comparable {
        private final Type instanceType;
        private final String methodName;
        private final Type returnType;
        private final List<Stub.Parameter> parameters;
        private final List<Type> parameterTypes;
        private final Integer parametersSize;
        private final String signature;

        private Exception exceptionThrownBeforeReturningValue;

        /**
         * Apex does not support dyanamically checking if an Object is an instance of a given Type with instanceof.
         * An instanceof check must be hard-coded.
         * This method is to verify the class/Type of Object of StubProvider.handleMethodCall(...)'s instance so
         * Stub can be used as a System.StubProvider for more than one class.
         * @param  instance instance passed into StubProvider.handleMethodCall(...)
         * @return          instance instanceof [Same type as instanceType]
         */
        public abstract Boolean isInstanceOf(Object instance);

        /**
         * @return   The arguments expected to be passed in when this method is stubbed via System.StubProvider.handleMethodCall(...).
         *           The returned List<Object> must have the same size as the number of parameters of this method.
         */
        public abstract List<Object> getExpectedArguments();

        /**
         * @return   The desired return value when this method is stubbed.
         *           If a test requires an Exception to be thrown, throw the Exception here.
         */
        public abstract Object getReturnValue();

        public Method(
            final Type instanceType,
            final Type returnType,
            final String methodName,
            final List<Stub.Parameter> parameters
        ) {
            if (instanceType == null) {
                throw new Stub.NullInstanceTypeException(
                    'Type instanceType cannot be null'
                );
            }
            this.instanceType = instanceType;

            // Set returnType and methodName
            {
                final Parameter parameter = new Parameter(
                    returnType,
                    methodName,
                    'Type returnType',
                    'String methodName'
                );
                this.returnType = parameter.type;
                this.methodName = parameter.name;
            }

            // Set parameters
            {
                if (parameters == null) {
                    final Type listStubParametersType = List<Stub.Parameter>.class;
                    throw new Stub.NullParameterException(
                        String.format(
                            '{0} parameters cannot be null',
                            new List<String>{listStubParametersType.getName()}
                        )
                    );
                }

                this.parameters = new List<Stub.Parameter>();
                this.parameterTypes = new List<Type>();
                this.parametersSize = parameters.size();

                for (Integer i = 0; i < this.parametersSize; i++) {
                    final Stub.Parameter parameter = parameters[i];

                    if (parameter == null) {
                        final Type listStubParametersType = List<Stub.Parameter>.class;
                        throw new Stub.NullParameterException(
                            String.format(
                                '{0} parameters at index {1} cannot be null',
                                new List<String>{
                                    listStubParametersType.getName(),
                                    String.valueOf(i)
                                }
                            )
                        );
                    }

                    this.parameters.add(parameter);
                    this.parameterTypes.add(parameter.getType());
                }
            }

            this.signature = Stub.getSignature(
                this.instanceType,
                this.returnType,
                this.methodName,
                this.parameters
            );
        }

        public Type getInstanceType() {
            return this.instanceType;
        }

        public Type getReturnType() {
            return this.returnType;
        }

        public String getMethodName() {
            return this.methodName;
        }

        public List<Stub.Parameter> getParameters() {
            return new List<Stub.Parameter>(this.parameters);
        }

        public Integer getParametersSize() {
            return this.parametersSize;
        }

        public String getSignature() {
            return this.signature;
        }

        public Exception getExceptionThrownBeforeReturningValue() {
            return this.exceptionThrownBeforeReturningValue;
        }

        public void setExceptionThrownBeforeReturningValue(
            Exception exceptionThrownBeforeReturningValue
        ) {
            this
                .exceptionThrownBeforeReturningValue = exceptionThrownBeforeReturningValue;
        }

        public void setExceptionThrownBeforeReturningValue(String exceptionMessage) {
            this
                .setExceptionThrownBeforeReturningValue(
                    exceptionMessage == null
                        ? null
                        : new Stub.MethodException(exceptionMessage)
                );
        }

        public Boolean isThrowingExceptionBeforeReturningValue() {
            return this.exceptionThrownBeforeReturningValue != null;
        }

        public Boolean matchesSignature(
            final Object instance,
            final String methodName,
            final Type returnType,
            final List<Type> parameterTypes
        ) {
            return this.isInstanceOf(instance) &&
                this.methodName.equalsIgnoreCase(methodName) &&
                this.returnType.equals(returnType) &&
                this.parameterTypes.equals(parameterTypes);
        }

        private void assertArgumentsAreValid(
            List<Object> arguments,
            String parameterName
        ) {
            final String parameterSignature =
                (List<Object>.class).getName() +
                ' ' +
                parameterName;

            System.assertNotEquals(
                null,
                arguments,
                parameterSignature + ' cannot be null'
            );

            System.assertEquals(
                this.getParametersSize(),
                arguments.size(),
                parameterSignature + ' size must equal Parameters Size'
            );
        }

        public void assertArgumentsEqualExpectedArguments(
            final List<Object> actualArguments
        ) {
            final List<Object> expectedArguments = this.getExpectedArguments();
            this.assertArgumentsAreValid(expectedArguments, 'getExpectedArguments()');
            this.assertArgumentsAreValid(actualArguments, 'actualArguments');

            final String methodSignature = this.getSignature();

            for (Integer i = 0; i < this.getParametersSize(); i++) {
                this
                    .parameters[i]
                    .assertArgument(expectedArguments[i], actualArguments[i], i, this);
            }
        }

        public Integer hashCode() {
            return this.instanceType.hashCode() + this.signature.hashCode();
        }

        public Boolean equals(Object method) {
            Stub.Method that;
            if (method instanceof Stub.Method) {
                that = (Stub.Method) method;
            }
            return that != null && this.instanceType.equals(that.instanceType) &&
                this.returnType.equals(that.returnType) &&
                this.methodName.equalsIgnoreCase(that.methodName) &&
                this.parameters.equals(that.parameters);
        }

        /**
         * Comparable implementation to override void List<Stub.Method>.sort() method.
         * @param  method Stub.Method to compare
         * @return        ORDERS BY (getInstanceType().name() ASC, getSignature() ASC)
         */
        public Integer compareTo(Object method) {
            if (method instanceof Stub.Method) {
                final Stub.Method that = (Stub.Method) method;
                if (this.instanceType.equals(that.instanceType)) {
                    return this.signature.compareTo(that.signature);
                }
                return this.instanceType.getName().compareTo(that.instanceType.getName());
            }
            return -1;
        }

        public override String toString() {
            return String.format(
                '[{0}: {1}]',
                new List<String>{this.instanceType.getName(), this.signature}
            );
        }
    }

    private static String getSignature(
        final Type instanceType,
        final Type returnType,
        final String methodName,
        final List<Stub.Parameter> parameters
    ) {
        List<String> parameterSignatures = new List<String>();
        for (Stub.Parameter parameter : parameters) {
            parameterSignatures.add(parameter.getSignature());
        }

        return String.format(
            '{1} {0}.{2}({3})',
            new List<String>{
                instanceType.getName(),
                returnType.getName(),
                methodName,
                String.join(parameterSignatures, ', ')
            }
        );
    }

    /**
     * @description     Used in testing to generate fake record IDs
     *                  without actually inserting records.
     * @param  describe Test before using.  Not all Schema.DescribeSObjectResults will work.
     * @return          Id using describe's Key Prefix.  Unique within Execution Context
     */
    @TestVisible
    private static Id generateFakeId(Schema.DescribeSObjectResult describe) {
        return Id.valueOf(
            describe.getKeyPrefix() + String.valueOf(ID_INDEX++).leftPad(12, '0')
        );
    }
    private static Integer ID_INDEX = 0;

    /**
     * We need to trust the Stub.Methods passed in and logged by Stub are not publically modifiable.
     * Below are implementation and Unit Test Methods to assert the immutability of the following:
     *     Set<Stub.Method> Stub.handleableMethods
     *     Set<Stub.Method> Stub.getHandleableMethods()
     *     List<Stub.Method> Stub.actualMethodsCalled
     *     List<Stub.Method> Stub.getActualMethodsCalled()
     */
    private class Method_hashCode extends Stub.Method {
        private Integer hashCode = Crypto.getRandomInteger();

        private Method_hashCode() {
            super(
                Stub.Method.class,
                Integer.class,
                'hashCode',
                new List<Stub.Parameter>()
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof Stub.Method;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>();
        }

        public override Object getReturnValue() {
            return this.hashCode;
        }
    }

    @IsTest
    private static void testStubHandleableMethodsAreImmutable() {
        final Stub.Method method = new Method_hashCode();

        Test.startTest();

        // Test Stub.handleableMethods and Stub.getHandleableMethods() cannot be mutated from the Set<Stub.Method> handleableMethods passed into Stub(Set<Stub.Method> handleableMethods) constructor.
        {
            // Intialize expectedMethodsCalled and assert expectedMethodsCalled is empty.
            final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method>();

            System.assertEquals(0, expectedMethodsCalled.size());

            // Construct Stub with expectedMethodsCalled and assert stub.handleableMethods and stub.getHandleableMethods() are empty.
            final Stub stub = new Stub(expectedMethodsCalled);

            System.assertEquals(0, stub.handleableMethods.size());

            System.assertEquals(0, stub.getHandleableMethods().size());

            // Mutate expectedMethodsCalled.
            expectedMethodsCalled.add(method);
            System.assertEquals(1, expectedMethodsCalled.size());

            // Assert stub.handleableMethods and stub.getHandleableMethods() are not mutated.
            System.assertEquals(0, stub.handleableMethods.size());

            System.assertEquals(0, stub.getHandleableMethods().size());
        }

        // Test Stub.handleableMethods and Stub.getHandleableMethods() cannot be mutated by the response of Stub.getHandleableMethods()
        {
            // Construct Stub with an empty List<Stub.Method> and assert stub.handleableMethods and stub.getHandleableMethods() are empty.
            final Stub stub = new Stub(new List<Stub.Method>());

            System.assertEquals(0, stub.handleableMethods.size());

            System.assertEquals(0, stub.getHandleableMethods().size());

            // Save getHandleableMethods() response as a variable, then mutate the variable.
            final Set<Stub.Method> handleableMethods = stub.getHandleableMethods();
            System.assertEquals(0, handleableMethods.size());

            handleableMethods.add(method);
            System.assertEquals(1, handleableMethods.size());

            // Assert stub.handleableMethods and stub.getHandleableMethods() were not mutated.
            System.assertEquals(0, stub.handleableMethods.size());

            System.assertEquals(0, stub.getHandleableMethods().size());
        }

        Test.stopTest();
    }

    @IsTest
    private static void testStubExpectedMethodsCalledAreImmutable() {
        final Stub.Method method = new Method_hashCode();

        Test.startTest();

        // Test Stub.expectedMethodsCalled and Stub.getExpectedMethodsCalled() cannot be mutated by the response of Stub.getExpectedMethodsCalled()
        {
            // Construct Stub with an empty List<Stub.Method> and assert stub.expectedMethodsCalled and stub.getExpectedMethodsCalled() are empty.
            final Stub stub = new Stub(new List<Stub.Method>());

            System.assertEquals(0, stub.expectedMethodsCalled.size());

            System.assertEquals(0, stub.getExpectedMethodsCalled().size());

            // Save getExpectedMethodsCalled() response as a variable, then mutate the variable.
            final List<Stub.Method> expectedMethodsCalled = stub.getExpectedMethodsCalled();
            System.assertEquals(0, expectedMethodsCalled.size());

            expectedMethodsCalled.add(method);
            System.assertEquals(1, expectedMethodsCalled.size());

            // Assert stub.expectedMethodsCalled and stub.getExpectedMethodsCalled() were not mutated.
            System.assertEquals(0, stub.expectedMethodsCalled.size());

            System.assertEquals(0, stub.getExpectedMethodsCalled().size());
        }

        Test.stopTest();
    }

    @IsTest
    private static void testStubMethodsCalledAreImmutable() {
        final Stub.Method method = new Method_hashCode();

        Test.startTest();

        // Test Stub.actualMethodsCalled and Stub.getActualMethodsCalled() cannot be mutated by the response of Stub.getActualMethodsCalled()
        {
            // Construct Stub with an empty List<Stub.Method> and assert stub.actualMethodsCalled and stub.getActualMethodsCalled() are empty.
            final Stub stub = new Stub(new List<Stub.Method>());

            System.assertEquals(0, stub.actualMethodsCalled.size());

            System.assertEquals(0, stub.getActualMethodsCalled().size());

            // Save getActualMethodsCalled() response as a variable, then mutate the variable.
            final List<Stub.Method> actualMethodsCalled = stub.getActualMethodsCalled();
            System.assertEquals(0, actualMethodsCalled.size());

            actualMethodsCalled.add(method);
            System.assertEquals(1, actualMethodsCalled.size());

            // Assert stub.actualMethodsCalled and stub.getActualMethodsCalled() were not mutated.
            System.assertEquals(0, stub.actualMethodsCalled.size());

            System.assertEquals(0, stub.getActualMethodsCalled().size());
        }

        Test.stopTest();
    }

    /**
     * We need to trust the Stub.Method signature cannot change.
     * The only possibly mutable parameter of Stub.Method is
     * Below are implementation and Unit Test Methods to assert the immutability of the following:
     *     List<Stub.Parameter> Stub.parameters
     *     List<Stub.Parameter> Stub.getParameters()
     * All other Stub.Method parameters have Types that are immutable.
     */
    @IsTest
    private static void testStubMethodParametersAreImmutable() {
        final Stub.Parameter parameter = new Stub.Parameter(
            void.class,
            'absolutelyNothingSinceTheTypeIsVoid'
        );

        final Stub.Parameter parameter2 = new Stub.Parameter(Integer.class, 'myInteger');

        System.assertNotEquals(parameter, parameter2);
        System.assertEquals(false, parameter === parameter2);

        Test.startTest();

        // Test Stub.Method.parameters and Stub.Method.getParameters() cannot be mutated by the response of Stub.Method.getParameters() by adding a member.
        {
            // Construct a Method_hashCode which should have an empty List<Stub.Parameter>.
            final Stub.Method method = new Method_hashCode();

            System.assertEquals(0, method.parameters.size());

            System.assertEquals(0, method.getParameters().size());

            // Save getParameters() response as a variable, then mutate the variable.
            final List<Stub.Parameter> parameters = method.getParameters();
            System.assertEquals(0, parameters.size());

            parameters.add(parameter);
            System.assertEquals(1, parameters.size());

            // Assert method.parameters and method.getParameters() were not mutated.
            System.assertEquals(0, method.parameters.size());

            System.assertEquals(0, method.getParameters().size());
        }

        // Test Stub.Method.parameters and Stub.Method.getParameters() cannot be mutated by the response of Stub.Method.getParameters() by changing a member at an index.
        {
            // Construct a Method_hashCode which should have an empty List<Stub.Parameter>.
            final Stub.Method method = new Method_hashCode();
            method.parameters.add(parameter);

            System.assertEquals(1, method.parameters.size());
            System.assertEquals(parameter, method.parameters[0]);
            System.assertEquals(true, parameter === method.parameters[0]);

            System.assertEquals(1, method.getParameters().size());
            System.assertEquals(parameter, method.getParameters()[0]);
            System.assertEquals(true, parameter === method.getParameters()[0]);

            // Save getParameters() response as a variable, then mutate the variable.
            final List<Stub.Parameter> parameters = method.getParameters();
            System.assertEquals(1, parameters.size());
            System.assertEquals(parameter, parameters[0]);

            parameters[0] = parameter2;
            System.assertNotEquals(parameter, parameters[0]);
            System.assertEquals(false, parameter === parameters[0]);

            // Assert method.parameters and method.getParameters() were not mutated.
            System.assertEquals(1, method.parameters.size());
            System.assertEquals(parameter, method.parameters[0]);
            System.assertEquals(true, parameter === method.parameters[0]);

            System.assertEquals(1, method.getParameters().size());
            System.assertEquals(parameter, method.getParameters()[0]);
        }

        Test.stopTest();
    }

    /**
     * We need to trust the Stub.Method signature cannot change.
     * The only possibly mutable parameter of Stub.Method is
     * Below are implementation and Unit Test Methods to assert the immutability of the following:
     *     List<Stub.Parameter> Stub.parameters
     *     List<Stub.Parameter> Stub.getParameters()
     * All other Stub.Method parameters have Types that are immutable.
     */
    @IsTest
    private static void testStubMethodParametersAssertExactEqualityIsMutable() {
        final Stub.Parameter parameter = new Stub.Parameter(
            void.class,
            'absolutelyNothingSinceTheTypeIsVoid'
        );

        System.assertEquals(false, parameter.getAssertArgumentHasExactEquality());

        Test.startTest();

        // Test Stub.Method.getParameters() members' Boolean assertArgumentHasExactEquality can be mutated.
        {
            // Intialize method with parameters having parameter as its only member.
            final Stub.Method method = new Method_hashCode();
            method.parameters.add(parameter);

            System.assertEquals(1, method.parameters.size());
            System.assertEquals(true, parameter === method.parameters[0]);
            System.assertEquals(
                false,
                method.parameters[0].getAssertArgumentHasExactEquality()
            );

            System.assertEquals(1, method.getParameters().size());
            System.assertEquals(true, parameter === method.getParameters()[0]);
            System.assertEquals(
                false,
                method.getParameters()[0].getAssertArgumentHasExactEquality()
            );

            // Call setAssertArgumentHasExactEquality(true) on getParemters()[0] and assert method.parameters and method.getParameters() were mutated.
            method.getParameters()[0].setAssertArgumentHasExactEquality(true);

            System.assertEquals(true, parameter.getAssertArgumentHasExactEquality());

            System.assertEquals(1, method.parameters.size());
            System.assertEquals(true, parameter === method.parameters[0]);
            System.assertEquals(
                true,
                method.parameters[0].getAssertArgumentHasExactEquality()
            );

            System.assertEquals(1, method.getParameters().size());
            System.assertEquals(true, parameter === method.getParameters()[0]);
            System.assertEquals(
                true,
                method.getParameters()[0].getAssertArgumentHasExactEquality()
            );

            // Call setAssertArgumentHasExactEquality(false) on getParemters()[0] and assert method.parameters and method.getParameters() were mutated.
            method.getParameters()[0].setAssertArgumentHasExactEquality(false);

            System.assertEquals(false, parameter.getAssertArgumentHasExactEquality());

            System.assertEquals(1, method.parameters.size());
            System.assertEquals(true, parameter === method.parameters[0]);
            System.assertEquals(
                false,
                method.parameters[0].getAssertArgumentHasExactEquality()
            );

            System.assertEquals(1, method.getParameters().size());
            System.assertEquals(true, parameter === method.getParameters()[0]);
            System.assertEquals(
                false,
                method.getParameters()[0].getAssertArgumentHasExactEquality()
            );
        }

        Test.stopTest();
    }

    /**
     * @description Tests Id Stub.generateFakeId(Schema.DescribeSObjectResult describe):
     *              - can generate IDs for all Custom SObjects
     *              - can generate IDs for common Standard Objects
     *              Not all Schema.DescribeSObjectResults will work.  Test before using.
     */
    @IsTest
    private static void testGenerateFakeId() {
        List<Schema.DescribeSObjectResult> describes = new List<Schema.DescribeSObjectResult>{
            Schema.SObjectType.Account,
            Schema.SObjectType.Account,
            Schema.SObjectType.Contact,
            Schema.SObjectType.Organization,
            Schema.SObjectType.User
        };

        // Add all Custom Objects to describes if its Key Prefix is not null.
        for (SObjectType sObjectType : Schema.getGlobalDescribe().values()) {
            final Schema.DescribeSObjectResult describe = sObjectType.getDescribe();
            if (describe.getKeyPrefix() != null && describe.isCustom()) {
                describes.add(sObjectType.getDescribe());
            }
        }

        // "Duplicate" describes so each DescribeSObjectResult is called twice in the test to assert Fake ID unqiueness.
        describes.addAll(describes);

        Test.startTest();

        // Assert generateFakeId(...) returns Ids whose SObjectType equals the argument's SObjectType and each generateFakeId is unique.
        {
            final Set<Id> fakeIds = new Set<Id>();

            for (Schema.DescribeSObjectResult describe : describes) {
                final Id fakeId = Stub.generateFakeId(describe);

                System.assertNotEquals(
                    null,
                    fakeId,
                    'Id Stub.generateFakeId(Schema.DescribeSObjectResult describe): cannot return null'
                );
                System.assertEquals(
                    describe.getSObjectType(),
                    fakeId.getSObjectType(),
                    'Id Stub.generateFakeId(Schema.DescribeSObjectResult describe) should have the same SObjectType as describe\'s SObjectType'
                );
                System.assertEquals(
                    true,
                    fakeIds.add(fakeId),
                    'Id Stub.generateFakeId(Schema.DescribeSObjectResult describe) should be unqiue even if same SObjectType as a previouly generated Id'
                );
            }
        }

        Test.stopTest();
    }
}