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

    public class Builder {
        public Builder(Type objType) {
            this.objType = objType;
        }

        public trackMethodCall(Signature signature, List<Object> args) {
            this.methodCall.add()
        }
    }
    private Type objType;
    List<MethoCall> methodCalls = new List<MethoCall>();

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

        for (MethoCall methodCall : methodCalls) {
            if (methodCall.matches(signature, args)) {
                return methodCall.handleCall();
            }
        }

        return null;
    }

    public MethoCall when(Signature signature) {
        MethoCall methodCall = new MethoCall(signature);
        methodCalls.add(methodCall);
        return methodCall;
    }

    public void assert() {
        for (MethoCall methodCall : methodCalls) {
            methodCall.assert();
        }
    }

    public Object create() {
        return Test.createStub(objType, this);
    }

    public class MethoCall {
        private Signature signature;
        private List<Object> args;
        private Boolean anyArgs = false;
        private Object returnValue;
        private Boolean throwException = false;
        private List<Id> recordIds;
        private Boolean isExpected = true;
        private Integer callCount = 0;
        private String testExceptionMessage = 'Exception thrown by Basic Stub.';

        public MethoCall(Signature signature) {
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

        public MethoCall calledWith(List<Object> args) {
            this.args = args;
            return this;
        }

        public MethoCall calledWithAny() {
            this.anyArgs = true;
            return this;
        }

        public MethoCall shouldNotBeCalled() {
            isExpected = false;
            return this;
        }

        public MethoCall thenReturn(Object returnValue) {
            this.returnValue = returnValue;
            return this;
        }

        public MethoCall thenSetRecordIds(Signature signature, List<Id> recordIds) {
            this.recordIds = recordIds;
            return this;
        }

        // TODO: Allow exceptions to be passed in.
        public MethoCall thenThrowException() {
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

        public Signature(String methodName, Type paramType, Type paramType2, Type paramType3, Type paramType4) {
            this(methodName, new List<Type>{ paramType, paramType2, paramType3, paramType4 });
        }

        public Signature(String methodName, Type paramType, Type paramType2, Type paramType3) {
            this(methodName, new List<Type>{ paramType, paramType2, paramType3 });
        }

        public Signature(String methodName, Type paramType, Type paramType2) {
            this(methodName, new List<Type>{ paramType, paramType2});
        }

        public Signature(String methodName, Type paramType) {
            this(methodName, new List<Type>{ paramType });
        }

        public Signature(String methodName) {
            this(methodName, new List<Type>());
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
