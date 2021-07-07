@IsTest
public with sharing class StubBuilder {
    private Type objType;
    List<SignatureBuilder> signatureBuilders = new List<SignatureBuilder>();

    public StubBuilder(Type objType) {
        this.objType = objType;
    }

    public SignatureBuilder when(String methodName, List<Type> paramTypes) {
        SignatureBuilder sb = new SignatureBuilder(this, methodName, paramTypes);
        signatureBuilders.add(sb);
        return sb;
    }

    public SignatureBuilder when(String methodName) {
        return when(methodName, new List<Type>());
    }

    public SignatureBuilder when(String methodName, Type paramType) {
        return when(methodName, new List<Type>{ paramType });
    }

    public SignatureBuilder when(String methodName, Type paramType, Type paramType2) {
        return when(methodName, new List<Type>{ paramType, paramType2 });
    }

    public SignatureBuilder when(
        String methodName,
        Type paramType,
        Type paramType2,
        Type paramType3
    ) {
        return when(methodName, new List<Type>{ paramType, paramType2, paramType3 });
    }

    public SignatureBuilder when(
        String methodName,
        Type paramType,
        Type paramType2,
        Type paramType3,
        Type paramType4
    ) {
        return when(
            methodName,
            new List<Type>{ paramType, paramType2, paramType3, paramType4 }
        );
    }

    public TestStub build() {
        List<TestStub.MethodCall> methodCalls = new List<TestStub.MethodCall>();
        for (SignatureBuilder sb : signatureBuilders) {
            methodCalls.addAll(sb.build());
        }
        return new TestStub(objType, methodCalls);
    }

    public class SignatureBuilder {
        private StubBuilder builder;
        private String methodName;
        private List<Type> paramTypes;

        List<MethodBuilder> methodBuilders = new List<MethodBuilder>();

        public SignatureBuilder(
            StubBuilder builder,
            String methodName,
            List<Type> paramTypes
        ) {
            this.builder = builder;
            this.methodName = methodName;
            this.paramTypes = paramTypes;
        }

        // TODO: Create a new method builder constructor that is without args
        // and be specific to why we are not checking args in the method match
        public MethodBuilder signatureMatches() {
            return calledWithList(null);
        }

        public MethodBuilder called() {
            return calledWithList(new List<Object>());
        }

        private MethodBuilder calledWithList(List<Object> args) {
            MethodBuilder mb = new MethodBuilder(this, args);
            methodBuilders.add(mb);
            return mb;
        }

        public MethodBuilder calledWith(Object arg) {
            return calledWithList(new List<Object>{ arg });
        }

        public MethodBuilder calledWith(Object arg, Object arg2) {
            return calledWithList(new List<Object>{ arg, arg2 });
        }

        public MethodBuilder calledWith(Object arg, Object arg2, Object arg3) {
            return calledWithList(new List<Object>{ arg, arg2, arg3 });
        }

        public MethodBuilder calledWith(
            Object arg,
            Object arg2,
            Object arg3,
            Object arg4
        ) {
            return calledWithList(new List<Object>{ arg, arg2, arg3, arg4 });
        }

        private StubBuilder endSignature() {
            return builder;
        }

        private List<TestStub.MethodCall> build() {
            TestStub.Signature signature = new TestStub.Signature(methodName, paramTypes);
            List<TestStub.MethodCall> methodCalls = new List<TestStub.MethodCall>();
            for (MethodBuilder mb : methodBuilders) {
                methodCalls.add(mb.build(signature));
            }

            return methodCalls;
        }
    }

    public class MethodBuilder {
        private SignatureBuilder signatureBuilder;
        private List<Object> args;
        private List<Id> ids;
        private Boolean throwException = false;
        private Object returnValue;
        private Integer expectedCalls;

        public MethodBuilder(SignatureBuilder signatureBuilder, List<Object> args) {
            this.args = args;
            this.signatureBuilder = signatureBuilder;
        }

        public MethodBuilder setIds(List<Id> ids) {
            this.ids = ids;
            return this;
        }

        public MethodBuilder expectedToBeCalled(Integer n) {
            this.expectedCalls = n;
            return this;
        }

        public StubBuilder expectedNotToBeCalled() {
            this.expectedCalls = 0;
            return signatureBuilder.endSignature();
        }

        public StubBuilder thenReturn(Object returnValue) {
            this.returnValue = returnValue;
            return signatureBuilder.endSignature();
        }

        public StubBuilder thenReturn() {
            return signatureBuilder.endSignature();
        }

        public StubBuilder thenThrowException() {
            throwException = true;
            return signatureBuilder.endSignature();
        }

        private TestStub.MethodCall build(TestStub.Signature signature) {
            TestStub.MethodCall methodCall = new TestStub.MethodCall(signature)
                .calledWith(args);
            if (ids != null) {
                methodCall.setIds(ids);
            }
            if (expectedCalls != null) {
                methodCall.setExpectedCalls(expectedCalls);
            }
            if (throwException) {
                methodCall.thenThrowException();
            } else {
                methodCall.thenReturn(returnValue);
            }

            return methodCall;
        }
    }
}
