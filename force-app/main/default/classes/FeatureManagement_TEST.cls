/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class FeatureManagement_TEST {
    private static final String ACTIVE_PROGRAMS = 'ActivePrograms';
    private static final Integer NUMBER_OF_ACTIVE_PROGRAMS = 10;
    private static final String FAKE_EXCEPTION = 'Exception thrown by Test!';

    @IsTest
    private static void shouldSetPackageIntegerValue() {
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

    // ----------     Test Implementation     ---------- //
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
