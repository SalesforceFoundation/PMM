@IsTest
public with sharing class Stub implements System.StubProvider {
    private Type objType;
    List<BoundMethod> boundMethods = new List<BoundMethod>();

    public Stub(Type objType) {
        this.objType = objType;
    }

    public Object handleMethodCall(
        Object obj,
        String methodName,
        Type returnType,
        List<Type> paramTypes,
        List<String> paramNames,
        List<Object> args
    ) {
        Signature signature = new Signature(methodName, paramTypes);

        for (BoundMethod boundMethod : boundMethods) {
            if (boundMethod.matches(signature, args)) {
                return boundMethod.handleCall();
            }
        }

        return null;
    }

    public BoundMethod when(Signature signature) {
        BoundMethod boundMethod = new BoundMethod(signature);
        boundMethods.add(boundMethod);
        return boundMethod;
    }

    public void assert() {
        for (BoundMethod boundMethod : boundMethods) {
            boundMethod.assert();
        }
    }

    public Object create() {
        return Test.createStub(objType, this);
    }

    public class BoundMethod {
        private Signature signature;
        private List<Object> args;
        private Object returnValue;
        private Boolean throwException = false;
        private List<Id> recordIds;
        private Boolean isExpected = true;
        private Integer callCount = 0;
        private String testExceptionMessage = 'Exception thrown by Basic Stub.';

        public BoundMethod(Signature signature) {
            this.signature = signature;
        }

        public Object handleCall() {
            callCount++;

            if (!isExpected) {
                System.assert(
                    false,
                    'Did not expect this method to be called with this argument: ' +
                    this.toString()
                );
            }

            if (recordIds != null) {
                List<SObject> sObjects = (List<SObject>) args[0];
                for (Integer i = 0; i < sObjects.size(); i++) {
                    sObjects[i].Id = recordIds[i];
                }
            }

            if (throwException) {
                throw new StubException(testExceptionMessage);
            }

            return returnValue;
        }

        public void assert() {
            if (isExpected && callCount < 1) {
                System.assert(
                    false,
                    'This bound method was not called as expected: ' + this.toString()
                );
            }

            if (!isExpected && callCount > 0) {
                System.assert(
                    false,
                    'This bound method should not have been called: ' + this.toString()
                );
            }
        }

        public BoundMethod calledWith(List<Object> args) {
            this.args = args;
            return this;
        }

        public BoundMethod shouldNotBeCalled() {
            isExpected = false;
            return this;
        }

        public BoundMethod thenReturn(Object returnValue) {
            this.returnValue = returnValue;
            return this;
        }

        public BoundMethod thenSetRecordIds(Signature signature, List<Id> recordIds) {
            this.recordIds = recordIds;
            return this;
        }

        // TODO: Allow exceptions to be passed in.
        public BoundMethod thenThrowException() {
            throwException = true;
            return this;
        }

        // Explore equals or making this better
        public Boolean matches(Signature signature, List<Object> args) {
            return this.signature.equals(signature) && argsMatch(args);
        }

        private Boolean argsMatch(List<Object> compareTo) {
            Boolean matchFound = args.size() == compareTo.size();

            for (Integer i = 0; i < compareTo.size(); i++) {
                if (!matchFound) {
                    break;
                }

                matchFound &= String.valueOf(args[i]) == String.valueOf(compareTo[i]);
            }

            return matchFound;
        }
    }

    public class Signature {
        private String methodName;
        private List<Type> paramTypes;
        private String signature;

        public Signature(String methodName, List<Type> paramTypes) {
            this.methodName = methodName;
            this.paramTypes = paramTypes;
        }

        public Signature(String methodName, Type paramType) {
            this.methodName = methodName;
            this.paramTypes = new List<Type>{ paramType };
        }

        public Signature(String methodName) {
            this.methodName = methodName;
            this.paramTypes = new List<Type>();
        }

        public Boolean equals(Object otherInstance) {
            if (otherInstance instanceof Signature) {
                Signature otherSignature = (Signature) otherInstance;
                return ((methodName == otherSignature.methodName) &&
                paramTypes.equals(otherSignature.paramTypes));
            }
            return false;
        }

        public Integer hashCode() {
            return this.getId().hashCode();
        }

        private String getId() {
            if (!String.isBlank(signature)) {
                return signature;
            }

            String format = '{0}:{1}';

            signature = String.format(
                format,
                new List<String>{ methodName, String.valueOf(paramTypes) }
            );

            return signature;
        }
    }

    private class StubException extends Exception {
    }
}
