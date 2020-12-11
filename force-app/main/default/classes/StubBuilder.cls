public with sharing class StubBuilder {
    private Type objType;
    List<SignatureBuilder> signatureBuilders = new List<SignatureBuilder>();

    public StubBuilder forType(Type objType) {
        this.objType = objType;
        return this;
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

    public Stub build() {
        List<Stub.MethodCall> methodCalls = new List<Stub.MethodCall>();
        for (SignatureBuilder sb : signatureBuilders) {
            methodCalls.addAll(sb.build());
        }
        return new Stub(objType, methodCalls);
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

        public MethodBuilder called() {
            return calledWith(new List<Object>());
        }

        // public MethodBuilder callWithAny() {
        //     return calledWith(new List<Object>());
        // }

        public MethodBuilder calledWith(List<Object> args) {
            MethodBuilder mb = new MethodBuilder(this, args);
            methodBuilders.add(mb);
            return mb;
        }

        public StubBuilder endSignature() {
            return builder;
        }

        public List<Stub.MethodCall> build() {
            Stub.Signature signature = new Stub.Signature(methodName, paramTypes);
            List<Stub.MethodCall> methodCalls = new List<Stub.MethodCall>();
            for (MethodBuilder mb : methodBuilder) {
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

        public MethodBuilder(SignatureBuilder signatureBuilder, List<Object> args) {
            this.args = args;
            this.signatureBuilder = signatureBuilder;
        }

        public MethodBuilder setIds(List<Id> ids) {
            this.ids = ids;
            return this;
        }

        public SignatureBuilder thenReturn(Object returnValue) {
            this.returnValue = returnValue;
            return signatureBuilder;
        }

        public SignatureBuilder thenThrowException() {
            throwException = true;
            return signatureBuilder;
        }

        public Stub.MethodCall build(Stub.Signature signature) {
            Stub.MethodCall methodCall = new Stub.MethodCall(signature).calledWith(args);
            if (ids != null) {
                methodCall.setIds(ids);
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
