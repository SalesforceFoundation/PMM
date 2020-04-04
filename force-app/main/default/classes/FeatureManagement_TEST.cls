@IsTest
public with sharing class FeatureManagement_TEST {
    private static final String ACTIVE_PROGRAMS = 'ActivePrograms';
    private static final Integer NUMBER_OF_ACTIVE_PROGRAMS = 10;
    private static final String FAKE_EXCEPTION = 'You asked for it!';

    @IsTest
    private static void shouldSetPackageIntegerValue() {
        // TODO: Verify this does not actually set the integer value for the org!
        FeatureManagement.getInstance()
            .setPackageIntegerValue(ACTIVE_PROGRAMS, NUMBER_OF_ACTIVE_PROGRAMS);

        System.assertEquals(
            NUMBER_OF_ACTIVE_PROGRAMS,
            FeatureManagement.getInstance().checkPackageIntegerValue(ACTIVE_PROGRAMS)
        );
    }

    @IsTest
    private static void shouldThrowErrorWhenParameterDoesNotExist() {
        String actualException;

        try {
            FeatureManagement.getInstance()
                .setPackageIntegerValue('fake', NUMBER_OF_ACTIVE_PROGRAMS);
        } catch (Exception ex) {
            actualException = ex.getMessage();
        }

        System.assertNotEquals(
            null,
            actualException,
            'Expected an exception to be thrown.'
        );
    }

    // ----------     Method Stubs     ---------- //
    public class SetPackageIntegerValue extends Stub.Method {
        public String apiName;
        public Integer value;

        public SetPackageIntegerValue() {
            super(
                FeatureManagement.class,
                Void.class,
                'setPackageIntegerValue',
                new List<Stub.Parameter>{
                    new Stub.Parameter(String.class, 'apiName'),
                    new Stub.Parameter(Integer.class, 'value')
                }
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof FeatureManagement;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>{ this.apiName, this.value };
        }

        public override Object getReturnValue() {
            return Void.class;
        }
    }

    public class FeatureParameter implements FeatureManagement.FeatureParameter {
        private Integer sendCount = 0;
        private Boolean throwsException = false;

        public void send() {
            if (throwsException) {
                throw new FakeException(FAKE_EXCEPTION);
            }

            sendCount++;
        }

        public Integer getSendCount() {
            return sendCount;
        }

        public FeatureParameter withThrowException() {
            throwsException = true;

            return this;
        }
    }

    private class FakeException extends Exception {
    }
}
