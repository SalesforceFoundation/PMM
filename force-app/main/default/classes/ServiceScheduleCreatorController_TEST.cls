/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceScheduleCreatorController_TEST {
    private static BasicStub serviceStub = new BasicStub(ServiceScheduleService.class);

    @IsTest
    private static void shouldGetModelFromService() {
        String methodName = 'getServiceScheduleModel';
        ServiceScheduleModel modelToReturn = new ServiceScheduleModel();

        serviceStub.withReturnValue(methodName, Id.class, modelToReturn);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        ServiceScheduleModel actualModel = ServiceScheduleCreatorController.getServiceScheduleModel(
            null
        );
        Test.stopTest();

        System.assertEquals(
            modelToReturn,
            actualModel,
            'Expected the controller to return the model from the Service.'
        );

        serviceStub.assertCalled(methodName, Id.class);
    }

    @IsTest
    private static void shouldPassModelToServiceOnPersist() {
        String methodName = 'persist';
        ServiceScheduleModel modelToPersist = new ServiceScheduleModel();

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        ServiceScheduleCreatorController.persist(modelToPersist);
        Test.stopTest();

        serviceStub.assertCalledWith(
            methodName,
            ServiceScheduleModel.class,
            modelToPersist
        );
    }

    @IsTest
    private static void shouldPassInfoToServiceOnAddParticipants() {
        String methodName = 'addParticipants';
        List<ProgramEngagement__c> engagements = new List<ProgramEngagement__c>();
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        ServiceScheduleCreatorController.addParticipants(engagements, scheduleId);
        Test.stopTest();

        serviceStub.assertCalledWith(
            methodName,
            new List<Type>{ List<ProgramEngagement__c>.class, Id.class },
            new List<Object>{ engagements, scheduleId }
        );
    }

    @IsTest
    private static void shouldGetExistingParticipantContactIds() {
        String methodName = 'getExistingParticipantContactIds';
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        List<Id> expected = new List<Id>();

        serviceStub.withReturnValue(methodName, Id.class, expected);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        List<Id> actual = ServiceScheduleCreatorController.getExistingParticipantContactIds(
            scheduleId
        );
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'Contact Ids not returned from the Service as expected.'
        );
        serviceStub.assertCalledWith(methodName, Id.class, scheduleId);
    }

    @IsTest
    private static void shouldCallServiceToCheckFLS() {
        String methodName = 'checkAddParticipantsFieldPermissions';
        Boolean expected = true;
        serviceStub.withReturnValue(methodName, expected);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        Boolean actual = ServiceScheduleCreatorController.checkAddParticipantsFieldPermissions();
        Test.stopTest();

        serviceStub.assertCalled(methodName);
        System.assertEquals(
            expected,
            actual,
            'Expected the controller to return the same value returned by the service.'
        );
    }

    @IsTest
    private static void shouldRethrowExceptionFromServiceOnFLSCheck() {
        String methodName = 'checkAddParticipantsFieldPermissions';

        serviceStub.withThrowException(methodName);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();
        Exception actualException;
        Boolean actual;
        Test.startTest();
        try {
            actual = ServiceScheduleCreatorController.checkAddParticipantsFieldPermissions();
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the service.'
        );
        System.assertEquals(null, actual);

        serviceStub.assertCalled(methodName);
    }

    @IsTest
    private static void shouldGetNewSessionFromService() {
        DateTime startDateTime = System.now();
        DateTime endDateTime = startDateTime.addHours(1);

        String methodName = 'createSession';
        ServiceSession__c sessionToReturn = new ServiceSession__c(
            Name = 'Default Name: ' + startDateTime.date().format(),
            SessionStart__c = startDateTime,
            SessionEnd__c = endDateTime
        );

        serviceStub.withReturnValue(
            methodName,
            new List<Type>{ ServiceSchedule__c.class, DateTime.class, DateTime.class },
            sessionToReturn
        );
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        ServiceSession__c actualSession = ServiceScheduleCreatorController.createSession(
            new ServiceSchedule__c(),
            startDateTime,
            endDateTime
        );
        Test.stopTest();

        serviceStub.assertCalledWith(
            methodName,
            new List<Type>{ ServiceSchedule__c.class, DateTime.class, DateTime.class },
            new List<Object>{ new ServiceSchedule__c(), startDateTime, endDateTime }
        );

        System.assertEquals(
            sessionToReturn,
            actualSession,
            'Expected the controller to return the session returned by the service.'
        );
    }

    @IsTest
    private static void shouldProcessSchedule() {
        String methodName = 'processSchedule';
        ServiceScheduleModel expected = new ServiceScheduleModel();
        ServiceScheduleModel model = new ServiceScheduleModel();

        serviceStub.withReturnValue(methodName, ServiceScheduleModel.class, expected);

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        ServiceScheduleModel actual = ServiceScheduleCreatorController.processSchedule(
            model
        );
        Test.stopTest();

        serviceStub.assertCalledWith(methodName, ServiceScheduleModel.class, model);
        System.assertEquals(
            expected,
            actual,
            'Sessions not passed back from Service as expected.'
        );
    }

    @IsTest
    private static void shouldDeleteSessionsAfter() {
        String methodName = 'deleteSessionsAfter';
        Integer expected = 3;
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        Date startDate = System.today();

        serviceStub.withReturnValue(
            methodName,
            new List<Type>{ Id.class, Date.class },
            expected
        );

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        Integer actual = ServiceScheduleCreatorController.deleteSessionsAfter(
            scheduleId,
            startDate
        );
        Test.stopTest();

        serviceStub.assertCalledWith(
            methodName,
            new List<Type>{ Id.class, Date.class },
            new List<Object>{ scheduleId, startDate }
        );
        System.assertEquals(
            expected,
            actual,
            'Count of deleted sessions not passed back from Service as expected.'
        );
    }

    @IsTest
    private static void rethrowsErrorFromGetModelOnService() {
        String methodName = 'getServiceScheduleModel';
        Exception actualException;

        serviceStub.withThrowException(methodName, Id.class);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        try {
            ServiceScheduleCreatorController.getServiceScheduleModel(null);
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the stub test exception message to have been thrown.'
        );
    }

    @IsTest
    private static void rethrowsErrorFromPersistOnService() {
        String methodName = 'persist';
        Exception actualException;

        serviceStub.withThrowException(methodName, ServiceScheduleModel.class);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        try {
            ServiceScheduleCreatorController.persist(new ServiceScheduleModel());
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the stub test exception message to have been thrown.'
        );
    }

    @IsTest
    private static void rethrowsErrorFromAddParticipantsOnService() {
        String methodName = 'addParticipants';
        List<ProgramEngagement__c> engagements = new List<ProgramEngagement__c>();
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        Exception actualException;

        serviceStub.withThrowException(
            methodName,
            new List<Type>{ List<ProgramEngagement__c>.class, Id.class }
        );

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        try {
            ServiceScheduleCreatorController.addParticipants(engagements, scheduleId);
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the stub test exception message to have been thrown.'
        );
        serviceStub.assertCalledWith(
            methodName,
            new List<Type>{ List<ProgramEngagement__c>.class, Id.class },
            new List<Object>{ engagements, scheduleId }
        );
    }

    @IsTest
    private static void rethrowsErrorFromGetExistingParticipantContactIdsOnService() {
        String methodName = 'getExistingParticipantContactIds';
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);

        List<Id> actual;
        Exception actualException;
        serviceStub.withThrowException(methodName, Id.class);

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();
        Test.startTest();
        try {
            actual = ServiceScheduleCreatorController.getExistingParticipantContactIds(
                scheduleId
            );
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the stub test exception message to have been thrown.'
        );
        serviceStub.assertCalledWith(methodName, Id.class, scheduleId);
        System.assertEquals(null, actual);
    }

    @IsTest
    private static void rethrowsErrorFromCreateSessionOnService() {
        String methodName = 'createSession';
        Exception actualException;

        serviceStub.withThrowException(
            methodName,
            new List<Type>{ ServiceSchedule__c.class, DateTime.class, DateTime.class }
        );

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        ServiceScheduleModel actual;
        Test.startTest();
        try {
            ServiceSession__c session = ServiceScheduleCreatorController.createSession(
                null,
                null,
                null
            );
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the stub test exception message to have been thrown.'
        );
        serviceStub.assertCalledWith(
            methodName,
            new List<Type>{ ServiceSchedule__c.class, DateTime.class, DateTime.class },
            new List<Object>{ null, null, null }
        );
    }

    @IsTest
    private static void rethrowsErrorFromProcessScheduleOnService() {
        String methodName = 'processSchedule';
        ServiceScheduleModel model = new ServiceScheduleModel();
        ServiceScheduleModel expected = new ServiceScheduleModel();
        Exception actualException;

        serviceStub.withThrowException(methodName, ServiceScheduleModel.class);

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        ServiceScheduleModel actual;
        Test.startTest();
        try {
            actual = ServiceScheduleCreatorController.processSchedule(model);
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the stub test exception message to have been thrown.'
        );
        serviceStub.assertCalledWith(methodName, ServiceScheduleModel.class, model);
        System.assertEquals(null, actual);
    }

    @IsTest
    private static void rethrowsErrorFromDeleteSessionsAfterOnService() {
        String methodName = 'deleteSessionsAfter';
        Integer expected = 3;
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        Date startDate = System.today();
        Exception actualException;

        serviceStub.withThrowException(
            methodName,
            new List<Type>{ Id.class, Date.class }
        );

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Integer actual;
        Test.startTest();
        try {
            actual = ServiceScheduleCreatorController.deleteSessionsAfter(
                scheduleId,
                startDate
            );
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the stub test exception message to have been thrown.'
        );
        serviceStub.assertCalledWith(
            methodName,
            new List<Type>{ Id.class, Date.class },
            new List<Object>{ scheduleId, startDate }
        );
        System.assertEquals(null, actual);
    }

    @IsTest
    private static void testGetSelectParticipantModel() {
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        SelectParticipantModel modelToReturn = new SelectParticipantModel();
        String methodName = 'getSelectParticipantModel';

        serviceStub.withReturnValue(methodName, Id.class, modelToReturn);

        Test.startTest();

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        SelectParticipantModel actual = ServiceScheduleCreatorController.getSelectParticipantModel(
            serviceId
        );

        Test.stopTest();

        System.assertNotEquals(
            null,
            actual,
            'Expected that actual participant model is not null'
        );
        System.assertEquals(
            true,
            modelToReturn === actual,
            'Expected the model returned from the service is what is returned by the controller'
        );

        serviceStub.assertCalledWith(methodName, Id.class, serviceId);
    }

    @IsTest
    private static void testGetSelectParticipantModelException() {
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        String methodName = 'getSelectParticipantModel';
        SelectParticipantModel actual;
        Exception actualException;

        serviceStub.withThrowException(methodName, Id.class);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        try {
            actual = ServiceScheduleCreatorController.getSelectParticipantModel(
                serviceId
            );
        } catch (Exception e) {
            actualException = e;
        }
        Test.stopTest();

        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to throw the exception from the service.'
        );

        System.assertEquals(null, actual, 'Expected that the actual value is null');

        serviceStub.assertCalledWith(methodName, Id.class, serviceId);
    }

    @IsTest
    private static void shouldReturnToday() {
        System.assertEquals(System.today(), ServiceScheduleCreatorController.getToday());
    }

    @IsTest
    private static void shouldReturnDayNum() {
        DateTime sunday = DateTime.newInstance(2012, 1, 1);
        for (Integer i = 0; i < 7; i++) {
            System.assertEquals(
                i + 1,
                ServiceScheduleCreatorController.getDayNum(sunday.addDays(i)),
                'The day num was not as expected.'
            );
        }
        System.assertEquals(System.today(), ServiceScheduleCreatorController.getToday());
    }
}
