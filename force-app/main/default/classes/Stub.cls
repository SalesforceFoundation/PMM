@IsTest
// .forType(AttendanceSelector.class)
//             .when('getServiceParticipantsByScheduleId', Id.class, Set<Id>.class)
//             .calledWith(sessionId)
//             .thenReturn(new List<ServiceParticipant__c>())
//             .when('getServiceDeliveriesBySessionId', Id.class)
//             .calledWith(scheduleId, new Set<Id>())
//             .thenReturn(new List<ServiceDelivery__c>())
//             .when('getSession', Id.class)
//             .calledWith(sessionId)
//             .thenReturn(new ServiceSession__c(ServiceSchedule__c = scheduleId))
//             .build();
public with sharing class Stub implements System.StubProvider {
    private Type objType;
    List<MethodCall> methodCalls = new List<MethodCall>();

    public Stub(Type objType) {
        this.objType = objType;
    }

    public Stub(Type objType, List<MethodCall> methodCalls) {
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

    public void assert() {
        for (MethodCall methodCall : methodCalls) {
            methodCall.assert();
        }
    }

    public Object create() {
        return Test.createStub(objType, this);
    }

    public class MethodCall {
        private Signature signature;
        private List<Object> args;
        private Boolean anyArgs = false;
        private Object returnValue;
        private Boolean throwException = false;
        private List<Id> ids;
        private Boolean isExpected = true;
        private Integer callCount = 0;
        private String testExceptionMessage = 'Exception thrown by Basic Stub.';

        public MethodCall(Signature signature) {
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

        public MethodCall calledWith(List<Object> args) {
            this.args = args;
            return this;
        }

        public MethodCall calledWithAny() {
            this.anyArgs = true;
            return this;
        }

        public MethodCall shouldNotBeCalled() {
            isExpected = false;
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

        // TODO: Allow exceptions to be passed in.
        public MethodCall thenThrowException() {
            throwException = true;
            return this;
        }

        // Explore equals or making this better
        public Boolean matches(Signature signature, List<Object> args) {
            return this.signature.equals(signature) && argsMatch(args);
        }

        private Boolean argsMatch(List<Object> compareTo) {
            if (anyArgs) {
                return true;
            }

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
