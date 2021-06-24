@IsTest
public with sharing class TestStub implements System.StubProvider {
    private Type objType;
    List<MethodCall> methodCalls = new List<MethodCall>();

    public TestStub(Type objType) {
        this.objType = objType;
    }

    public TestStub(Type objType, List<MethodCall> methodCalls) {
        this(objType);
        this.methodCalls = methodCalls;
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
        for (MethodCall methodCall : methodCalls) {
            if (methodCall.matches(signature, args)) {
                return methodCall.handleCall();
            }
        }

        return null;
    }

    public void assertCalledAsExpected() {
        for (MethodCall methodCall : methodCalls) {
            methodCall.expectedToHaveBeenCalled();
        }
    }

    public Object create() {
        return Test.createStub(objType, this);
    }

    public class MethodCall {
        private Signature signature;
        private List<Object> args;
        private Object returnValue;
        private Boolean throwException = false;
        private List<Id> ids;
        private Integer callCount = 0;
        private Integer expectedCalls;
        private String testExceptionMessage = 'Exception thrown by TestStub.';

        public MethodCall(Signature signature) {
            this.signature = signature;
        }

        public Object handleCall() {
            callCount++;

            if (ids != null) {
                List<SObject> sObjects = (List<SObject>) args[0];
                for (Integer i = 0; i < sObjects.size(); i++) {
                    sObjects[i].Id = ids[i];
                }
            }

            if (throwException) {
                throw new StubException(testExceptionMessage);
            }

            return returnValue;
        }

        public void expectedToHaveBeenCalled() {
            String message =
                'This bound method was called ' +
                callCount +
                'x and was expected to be called ';
            if (expectedCalls != null) {
                message += expectedCalls + 'x. ';
            } else {
                message += 'at least 1x. ';
            }

            if (
                (expectedCalls != null && expectedCalls != callCount) ||
                (expectedCalls == null &&
                callCount < 1)
            ) {
                System.assert(false, message + this.toString());
            }
        }

        public MethodCall calledWith(List<Object> args) {
            this.args = args;
            return this;
        }

        public MethodCall thenReturn(Object returnValue) {
            this.returnValue = returnValue;
            return this;
        }

        public MethodCall setIds(List<Id> ids) {
            this.ids = ids;
            return this;
        }

        public MethodCall setExpectedCalls(Integer expectedCalls) {
            this.expectedCalls = expectedCalls;
            return this;
        }

        // TODO: Allow exceptions to be passed in.
        public MethodCall thenThrowException() {
            throwException = true;
            return this;
        }

        // TODO: Explore equals or making this better
        public Boolean matches(Signature signature, List<Object> args) {
            return this.signature.equals(signature) && argsMatch(args);
        }

        private Boolean argsMatch(List<Object> compareTo) {
            // TODO: Make this smarter: args will only be null when we request to check on signature alone
            if (args == null) {
                return true;
            }

            Boolean matchesSoFar = args.size() == compareTo.size();

            for (Integer i = 0; i < compareTo.size(); i++) {
                if (!matchesSoFar) {
                    break;
                }

                matchesSoFar &= String.valueOf(args[i]) == String.valueOf(compareTo[i]);
            }

            return matchesSoFar;
        }
    }

    public class Signature {
        private String methodName;
        private List<Type> paramTypes;

        public Signature(String methodName, List<Type> paramTypes) {
            this.methodName = methodName;
            this.paramTypes = paramTypes;
        }

        public Boolean equals(Object otherInstance) {
            if (otherInstance instanceof Signature) {
                Signature otherSignature = (Signature) otherInstance;
                return ((methodName == otherSignature.methodName) &&
                paramTypes.equals(otherSignature.paramTypes));
            }
            return false;
        }
    }

    private class StubException extends Exception {
    }
}
