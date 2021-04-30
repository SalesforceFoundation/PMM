/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceDeliveryService_TEST {
    private static BasicStub deliverySelectorStub = new BasicStub(
        ServiceDeliverySelector.class
    );
    private static BasicStub domainStub = new BasicStub(ServiceDeliveryDomain.class);
    private static BasicStub permValidatorStub = new BasicStub(PermissionValidator.class);
    private static BasicStub systemAccessStub = new BasicStub(SystemAccess.class);

    private static ServiceDeliveryService service = new ServiceDeliveryService();

    // @IsTest
    // private static void shouldNotCallUpdateWithoutIdsForAttendance() {
    //     Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>();
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     service.doRollups(idsByLookupFieldToTarget, null);

    //     systemAccessStub.assertNotCalled('getAttendanceRecords');
    //     systemAccessStub.assertNotCalled('updateRecords');
    // }

    // @IsTest
    // private static void shouldNotCallUpdateWithoutIdsForLastServiceDate() {
    //     Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>();
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     service.doRollups(null, idsByLookupFieldToTarget);

    //     systemAccessStub.assertNotCalled('getParentsWithServiceDeliveries');
    //     systemAccessStub.assertNotCalled('updateRecords');
    // }

    // @IsTest
    // private static void shouldNotContinueWithoutParents() {
    //     List<SObject> parents = new List<SObject>();
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     service.doRollups(Contact.SObjectType, parents);

    //     systemAccessStub.assertNotCalled('getAttendanceRecords');
    //     systemAccessStub.assertNotCalled('getParentsWithServiceDeliveries');
    //     systemAccessStub.assertNotCalled('updateRecords');
    // }

    // @IsTest
    // private static void shouldNotCallUpdateWithoutBucketedStatus() {
    //     String getAttendanceRecords = 'getAttendanceRecords';
    //     Id contactId = TestUtil.mockId(Contact.SObjectType);
    //     Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>{
    //         ServiceDelivery__c.Contact__c => new Set<Id>{ contactId }
    //     };
    //     systemAccessStub.withReturnValue(
    //         getAttendanceRecords,
    //         new List<Type>{ SObjectField.class, Set<Id>.class, List<String>.class },
    //         new List<ServiceDelivery__c>{
    //             new ServiceDelivery__c(
    //                 Contact__c = contactId,
    //                 AttendanceStatus__c = 'Wasn\'t Me'
    //             )
    //         }
    //     );
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     service.doRollups(idsByLookupFieldToTarget, null);

    //     systemAccessStub.assertNotCalled('updateRecords');
    // }

    // @IsTest
    // private static void shouldGetBuckets() {
    //     Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>();
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     System.assertNotEquals(
    //         null,
    //         service.statusBuckets,
    //         'Expected the buckets to have been found'
    //     );
    // }

    // @IsTest
    // private static void shouldSetAbsentAndPresentCountsToNullWhenNoRecordsFound() {
    //     String getAttendanceRecords = 'getAttendanceRecords';
    //     Contact contactRecord = new Contact(
    //         Id = TestUtil.mockId(Contact.SObjectType),
    //         NumPresentServiceDeliveries__c = null,
    //         NumAbsentServiceDeliveries__c = null,
    //         ConsecutiveAbsences__c = null
    //     );
    //     Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>{
    //         ServiceDelivery__c.Contact__c => new Set<Id>{ contactRecord.Id }
    //     };
    //     systemAccessStub.withReturnValue(
    //         getAttendanceRecords,
    //         new List<Type>{ SObjectField.class, Set<Id>.class, List<String>.class },
    //         new List<ServiceDelivery__c>()
    //     );
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     service.doRollups(idsByLookupFieldToTarget, null);

    //     systemAccessStub.assertCalledWith(
    //         'updateRecords',
    //         List<SObject>.class,
    //         new List<SObject>{ contactRecord }
    //     );
    // }

    @IsTest
    private static void shouldSetLastServiceDateToNullWhenNoRecordsFound() {
        // String getParentsWithServiceDeliveries = 'getParentsWithServiceDeliveries';
        // Map<String, Object> contactFields = new Map<String, Object>{
        //     'Id' => TestUtil.mockId(Contact.SObjectType),
        //     String.valueOf(Contact.LastServiceDate__c) => null,
        //     ServiceDelivery__c.Contact__c.getDescribe()
        //         .getRelationshipName() => new List<ServiceDelivery__c>()
        // };
        // Contact contactRecord = (Contact) JSON.deserialize(
        //     JSON.serialize(contactFields),
        //     Contact.class
        // );
        // Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>{
        //     ServiceDelivery__c.Contact__c => new Set<Id>{ contactRecord.Id }
        // };
        // systemAccessStub.withReturnValue(
        //     getParentsWithServiceDeliveries,
        //     new List<Type>{
        //         SObjectField.class,
        //         Set<Id>.class,
        //         SObjectType.class,
        //         String.class
        //     },
        //     new List<Contact>{ contactRecord }
        // );
        // service.systemAccess = (SystemAccess) systemAccessStub.createMock();

        // service.doRollups(null, idsByLookupFieldToTarget);

        // systemAccessStub.assertCalledWith(
        //     'updateRecords',
        //     List<SObject>.class,
        //     new List<SObject>{ contactRecord }
        // );
    }

    // @IsTest
    // private static void shouldReturnFromLastServiceDateOnIrrelevantObjects() {
    //     String getParentsWithServiceDeliveries = 'getParentsWithServiceDeliveries';
    //     Id serviceId = TestUtil.mockId(Service__c.SObjectType);
    //     Service__c serviceRecord = new Service__c(Id = serviceId);
    //     Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>{
    //         ServiceDelivery__c.Service__c => new Set<Id>{ serviceId }
    //     };
    //     systemAccessStub.withReturnValue(
    //         getParentsWithServiceDeliveries,
    //         new List<Type>{
    //             SObjectField.class,
    //             Set<Id>.class,
    //             SObjectType.class,
    //             String.class
    //         },
    //         new List<Service__c>{ serviceRecord }
    //     );
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     service.doRollups(null, idsByLookupFieldToTarget);

    //     systemAccessStub.assertNotCalled('updateRecords');
    // }

    // @IsTest
    // private static void shouldNotCountWhenIdIsNull() {
    //     String getAttendanceRecords = 'getAttendanceRecords';
    //     Contact contactRecord = new Contact(
    //         Id = TestUtil.mockId(Contact.SObjectType),
    //         NumPresentServiceDeliveries__c = null,
    //         NumAbsentServiceDeliveries__c = null,
    //         ConsecutiveAbsences__c = null
    //     );
    //     Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>{
    //         ServiceDelivery__c.Contact__c => new Set<Id>{ contactRecord.Id }
    //     };
    //     systemAccessStub.withReturnValue(
    //         getAttendanceRecords,
    //         new List<Type>{ SObjectField.class, Set<Id>.class, List<String>.class },
    //         new List<ServiceDelivery__c>{
    //             new ServiceDelivery__c(Contact__c = null, AttendanceStatus__c = 'Present')
    //         }
    //     );
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     service.doRollups(idsByLookupFieldToTarget, null);

    //     systemAccessStub.assertCalledWith(
    //         'updateRecords',
    //         List<SObject>.class,
    //         new List<SObject>{ contactRecord }
    //     );
    // }

    // @IsTest
    // private static void shouldIncrementAbsentCountWhenAbsentRecordFound() {
    //     String getAttendanceRecords = 'getAttendanceRecords';
    //     Contact contactRecord = new Contact(
    //         Id = TestUtil.mockId(Contact.SObjectType),
    //         NumPresentServiceDeliveries__c = null,
    //         NumAbsentServiceDeliveries__c = 1,
    //         ConsecutiveAbsences__c = 1
    //     );
    //     Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>{
    //         ServiceDelivery__c.Contact__c => new Set<Id>{ contactRecord.Id }
    //     };
    //     systemAccessStub.withReturnValue(
    //         getAttendanceRecords,
    //         new List<Type>{ SObjectField.class, Set<Id>.class, List<String>.class },
    //         new List<ServiceDelivery__c>{
    //             new ServiceDelivery__c(
    //                 Contact__c = contactRecord.Id,
    //                 AttendanceStatus__c = 'Excused Absence'
    //             )
    //         }
    //     );
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     service.doRollups(idsByLookupFieldToTarget, null);

    //     systemAccessStub.assertCalledWith(
    //         'updateRecords',
    //         List<SObject>.class,
    //         new List<SObject>{ contactRecord }
    //     );
    // }

    // @IsTest
    // private static void shouldIncrementPresentCountWhenPresentRecordFound() {
    //     String getAttendanceRecords = 'getAttendanceRecords';
    //     Contact contactRecord = new Contact(
    //         Id = TestUtil.mockId(Contact.SObjectType),
    //         NumPresentServiceDeliveries__c = 1,
    //         NumAbsentServiceDeliveries__c = null,
    //         ConsecutiveAbsences__c = 0
    //     );
    //     Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>{
    //         ServiceDelivery__c.Contact__c => new Set<Id>{ contactRecord.Id }
    //     };
    //     systemAccessStub.withReturnValue(
    //         getAttendanceRecords,
    //         new List<Type>{ SObjectField.class, Set<Id>.class, List<String>.class },
    //         new List<ServiceDelivery__c>{
    //             new ServiceDelivery__c(
    //                 Contact__c = contactRecord.Id,
    //                 AttendanceStatus__c = 'Present',
    //                 DeliveryDate__c = System.today()
    //             )
    //         }
    //     );
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     service.doRollups(idsByLookupFieldToTarget, null);

    //     systemAccessStub.assertCalledWith(
    //         'updateRecords',
    //         List<SObject>.class,
    //         new List<SObject>{ contactRecord }
    //     );
    // }

    // @IsTest
    // private static void shouldIncrementAbsentAndPresentCountWhenBothRecordsFound() {
    //     String getAttendanceRecords = 'getAttendanceRecords';
    //     Contact contactRecord = new Contact(
    //         Id = TestUtil.mockId(Contact.SObjectType),
    //         NumPresentServiceDeliveries__c = 1,
    //         NumAbsentServiceDeliveries__c = 3,
    //         ConsecutiveAbsences__c = 2
    //     );
    //     Map<SObjectField, Set<Id>> idsByLookupFieldToTarget = new Map<SObjectField, Set<Id>>{
    //         ServiceDelivery__c.Contact__c => new Set<Id>{ contactRecord.Id }
    //     };
    //     systemAccessStub.withReturnValue(
    //         getAttendanceRecords,
    //         new List<Type>{ SObjectField.class, Set<Id>.class, List<String>.class },
    //         new List<ServiceDelivery__c>{
    //             new ServiceDelivery__c(
    //                 Contact__c = contactRecord.Id,
    //                 AttendanceStatus__c = 'Excused Absence',
    //                 DeliveryDate__c = System.today()
    //             ),
    //             new ServiceDelivery__c(
    //                 Contact__c = contactRecord.Id,
    //                 AttendanceStatus__c = 'Unexcused Absence',
    //                 DeliveryDate__c = System.today() - 1
    //             ),
    //             new ServiceDelivery__c(
    //                 Contact__c = contactRecord.Id,
    //                 AttendanceStatus__c = 'Present',
    //                 DeliveryDate__c = System.today() - 2
    //             ),
    //             new ServiceDelivery__c(
    //                 Contact__c = contactRecord.Id,
    //                 AttendanceStatus__c = 'Unexcused Absence',
    //                 DeliveryDate__c = System.today() - 3
    //             )
    //         }
    //     );
    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();

    //     service.doRollups(idsByLookupFieldToTarget, null);

    //     systemAccessStub.assertCalledWith(
    //         'updateRecords',
    //         List<SObject>.class,
    //         new List<SObject>{ contactRecord }
    //     );
    // }

    // @IsTest
    // private static void shouldCalculateWhenAbsentRecordFoundFromContact() {
    //     Id contactId = TestUtil.mockId(Contact.SObjectType);
    //     Contact sourceContactRecord = (Contact) JSON.deserialize(
    //         JSON.serialize(
    //             new Map<String, Object>{
    //                 'Id' => contactId,
    //                 Util.prefixNamespace(
    //                     'Service_Deliveries__r'
    //                 ) => new Map<String, Object>{
    //                     'totalSize' => 2,
    //                     'done' => true,
    //                     'records' => new List<ServiceDelivery__c>{
    //                         new ServiceDelivery__c(
    //                             Contact__c = contactId,
    //                             AttendanceStatus__c = 'Excused Absence',
    //                             DeliveryDate__c = System.today()
    //                         ),
    //                         new ServiceDelivery__c(
    //                             Contact__c = contactId,
    //                             AttendanceStatus__c = 'Present',
    //                             Quantity__c = 5,
    //                             DeliveryDate__c = System.today() - 1
    //                         )
    //                     }
    //                 }
    //             }
    //         ),
    //         Contact.class
    //     );

    //     Contact targetContactRecord = new Contact(
    //         Id = contactId,
    //         NumPresentServiceDeliveries__c = 1,
    //         NumAbsentServiceDeliveries__c = 1,
    //         ConsecutiveAbsences__c = 1,
    //         LastServiceDate__c = System.today() - 1
    //     );

    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();
    //     service.doRollups(Contact.SObjectType, new List<Contact>{ sourceContactRecord });

    //     systemAccessStub.assertCalledWith(
    //         'updateRecords',
    //         List<SObject>.class,
    //         new List<SObject>{ targetContactRecord }
    //     );
    // }

    // @IsTest
    // private static void shouldResetRecordWhenNoServiceDeliveriesFoundForContact() {
    //     Id contactId = TestUtil.mockId(Contact.SObjectType);
    //     Contact sourceContactRecord = new Contact(
    //         Id = contactId,
    //         NumPresentServiceDeliveries__c = 1,
    //         NumAbsentServiceDeliveries__c = 1,
    //         ConsecutiveAbsences__c = 1,
    //         LastServiceDate__c = System.today()
    //     );

    //     Contact targetContactRecord = new Contact(
    //         Id = contactId,
    //         NumPresentServiceDeliveries__c = null,
    //         NumAbsentServiceDeliveries__c = null,
    //         ConsecutiveAbsences__c = null,
    //         LastServiceDate__c = null
    //     );

    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();
    //     service.doRollups(Contact.SObjectType, new List<Contact>{ sourceContactRecord });

    //     systemAccessStub.assertCalledWith(
    //         'updateRecords',
    //         List<SObject>.class,
    //         new List<SObject>{ targetContactRecord }
    //     );
    // }

    // @IsTest
    // private static void shouldCalculateWhenAbsentRecordFoundFromService() {
    //     Id serviceId = TestUtil.mockId(Service__c.SObjectType);
    //     Service__c sourceServiceRecord = (Service__c) JSON.deserialize(
    //         JSON.serialize(
    //             new Map<String, Object>{
    //                 'Id' => serviceId,
    //                 Util.prefixNamespace(
    //                     'ServiceDeliveries__r'
    //                 ) => new Map<String, Object>{
    //                     'totalSize' => 2,
    //                     'done' => true,
    //                     'records' => new List<ServiceDelivery__c>{
    //                         new ServiceDelivery__c(
    //                             Service__c = serviceId,
    //                             AttendanceStatus__c = 'Excused Absence',
    //                             DeliveryDate__c = System.today()
    //                         ),
    //                         new ServiceDelivery__c(
    //                             Service__c = serviceId,
    //                             AttendanceStatus__c = 'Present',
    //                             Quantity__c = 5,
    //                             DeliveryDate__c = System.today() - 1
    //                         )
    //                     }
    //                 }
    //             }
    //         ),
    //         Service__c.class
    //     );

    //     Service__c targetServiceRecord = new Service__c(
    //         Id = serviceId,
    //         NumPresentServiceDeliveries__c = 1,
    //         NumAbsentServiceDeliveries__c = 1
    //     );

    //     service.systemAccess = (SystemAccess) systemAccessStub.createMock();
    //     service.doRollups(
    //         Service__c.SObjectType,
    //         new List<Service__c>{ sourceServiceRecord }
    //     );

    //     systemAccessStub.assertCalledWith(
    //         'updateRecords',
    //         List<SObject>.class,
    //         new List<SObject>{ targetServiceRecord }
    //     );
    // }

    // @IsTest
    // private static void getRosterShouldCallSelector() {
    //     String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
    //     String getServiceParticipantsByScheduleId = 'getServiceParticipantsByScheduleId';
    //     String getSession = 'getSession';
    //     Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
    //     Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
    //     service.deliverySelector = (ServiceDeliverySelector) deliverySelectorStub.createMock();
    //     deliverySelectorStub.withReturnValue(
    //         getServiceDeliveriesBySessionId,
    //         Id.class,
    //         new List<ServiceDelivery__c>()
    //     );
    //     deliverySelectorStub.withReturnValue(
    //         getServiceParticipantsByScheduleId,
    //         new List<Type>{ Id.class, Set<Id>.class },
    //         new List<ServiceParticipant__c>()
    //     );
    //     deliverySelectorStub.withReturnValue(
    //         getSession,
    //         Id.class,
    //         new ServiceSession__c(ServiceSchedule__c = scheduleId)
    //     );

    //     Test.startTest();
    //     service.generateRoster(sessionId);
    //     Test.stopTest();

    //     deliverySelectorStub.assertCalledWith(
    //         getServiceDeliveriesBySessionId,
    //         Id.class,
    //         sessionId
    //     );

    //     deliverySelectorStub.assertCalledWith(
    //         getServiceParticipantsByScheduleId,
    //         new List<Type>{ Id.class, Set<Id>.class },
    //         new List<Object>{ scheduleId, new Set<Id>() }
    //     );
    // }

    // @IsTest
    // private static void getRosterShouldReturnExistingDeliveries() {
    //     String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
    //     String getServiceParticipantsByScheduleId = 'getServiceParticipantsByScheduleId';
    //     String getSession = 'getSession';
    //     List<ServiceDelivery__c> deliveriesToReturn = new List<ServiceDelivery__c>{
    //         createMockDelivery()
    //     };
    //     Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);

    //     service.deliverySelector = (ServiceDeliverySelector) deliverySelectorStub.createMock();
    //     deliverySelectorStub.withReturnValue(
    //         getServiceDeliveriesBySessionId,
    //         Id.class,
    //         deliveriesToReturn
    //     );
    //     deliverySelectorStub.withReturnValue(
    //         getServiceParticipantsByScheduleId,
    //         new List<Type>{ Id.class, Set<Id>.class },
    //         new List<ServiceParticipant__c>()
    //     );
    //     deliverySelectorStub.withReturnValue(
    //         getSession,
    //         Id.class,
    //         new ServiceSession__c(ServiceSchedule__c = scheduleId)
    //     );

    //     Test.startTest();
    //     System.assertEquals(
    //         deliveriesToReturn,
    //         service.generateRoster(deliveriesToReturn[0].ServiceSession__c),
    //         'Expected only the service deliveries returned by the selector.'
    //     );
    //     Test.stopTest();

    //     deliverySelectorStub.assertCalledWith(
    //         getServiceParticipantsByScheduleId,
    //         new List<Type>{ Id.class, Set<Id>.class },
    //         new List<Object>{
    //             scheduleId,
    //             new Set<Id>{ deliveriesToReturn[0].Contact__c }
    //         }
    //     );
    // }

    // @IsTest
    // private static void getRosterShouldReturnParticipantsAsDeliveries() {
    //     String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
    //     String getServiceParticipantsByScheduleId = 'getServiceParticipantsByScheduleId';
    //     String getSession = 'getSession';
    //     Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
    //     Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
    //     Id serviceId = TestUtil.mockId(Service__c.SObjectType);
    //     List<ServiceParticipant__c> participantsToReturn = new List<ServiceParticipant__c>{
    //         createMockParticipant(),
    //         createMockParticipant()
    //     };
    //     List<ServiceDelivery__c> actualDeliveries;

    //     service.deliverySelector = (ServiceDeliverySelector) deliverySelectorStub.createMock();
    //     deliverySelectorStub.withReturnValue(
    //         getServiceDeliveriesBySessionId,
    //         Id.class,
    //         new List<ServiceDelivery__c>()
    //     );
    //     deliverySelectorStub.withReturnValue(
    //         getServiceParticipantsByScheduleId,
    //         new List<Type>{ Id.class, Set<Id>.class },
    //         participantsToReturn
    //     );
    //     deliverySelectorStub.withReturnValue(
    //         getSession,
    //         Id.class,
    //         new ServiceSession__c(
    //             Id = sessionId,
    //             ServiceSchedule__c = scheduleId,
    //             ServiceSchedule__r = new ServiceSchedule__c(Service__c = serviceId)
    //         )
    //     );

    //     Test.startTest();
    //     actualDeliveries = service.generateRoster(sessionId);
    //     Test.stopTest();

    //     System.assertEquals(
    //         participantsToReturn.size(),
    //         actualDeliveries.size(),
    //         'Expected only the service participants returned by the selector as service deliveries.'
    //     );

    //     for (Integer i = 0; i < participantsToReturn.size(); i++) {
    //         System.assertEquals(
    //             participantsToReturn[i].Contact__c,
    //             actualDeliveries[i].Contact__c,
    //             'Expected the contact id to have been copied from the particpant.'
    //         );
    //         System.assertEquals(
    //             serviceId,
    //             actualDeliveries[i].Service__c,
    //             'Expected the service id to have been copied from the Session via the Schedule.'
    //         );
    //         System.assertEquals(
    //             participantsToReturn[i].ProgramEngagement__c,
    //             actualDeliveries[i].ProgramEngagement__c,
    //             'Expected the program engagement id to have been copied from the particpant.'
    //         );
    //         System.assertEquals(
    //             sessionId,
    //             actualDeliveries[i].ServiceSession__c,
    //             'Expected the session id to have been set.'
    //         );
    //     }

    //     deliverySelectorStub.assertCalledWith(
    //         getServiceParticipantsByScheduleId,
    //         new List<Type>{ Id.class, Set<Id>.class },
    //         new List<Object>{ scheduleId, new Set<Id>{} }
    //     );
    // }

    // @IsTest
    // private static void getRosterShouldCombineDeliveriesAndParticipants() {
    //     String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
    //     String getServiceParticipantsByScheduleId = 'getServiceParticipantsByScheduleId';
    //     String getSession = 'getSession';
    //     Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
    //     Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
    //     List<ServiceDelivery__c> deliveriesToReturn = new List<ServiceDelivery__c>{
    //         createMockDelivery()
    //     };
    //     List<ServiceParticipant__c> participantsToReturn = new List<ServiceParticipant__c>{
    //         createMockParticipant(),
    //         createMockParticipant()
    //     };
    //     List<ServiceDelivery__c> actualDeliveries;

    //     service.deliverySelector = (ServiceDeliverySelector) deliverySelectorStub.createMock();
    //     deliverySelectorStub.withReturnValue(
    //         getServiceDeliveriesBySessionId,
    //         Id.class,
    //         deliveriesToReturn
    //     );
    //     deliverySelectorStub.withReturnValue(
    //         getServiceParticipantsByScheduleId,
    //         new List<Type>{ Id.class, Set<Id>.class },
    //         participantsToReturn
    //     );
    //     deliverySelectorStub.withReturnValue(
    //         getSession,
    //         Id.class,
    //         new ServiceSession__c(ServiceSchedule__c = scheduleId)
    //     );

    //     Test.startTest();
    //     actualDeliveries = service.generateRoster(sessionId);
    //     Test.stopTest();

    //     System.assertEquals(
    //         participantsToReturn.size() + deliveriesToReturn.size(),
    //         actualDeliveries.size(),
    //         'Expected participants returned by the selector as service deliveries with the existing service deliveries to be returned.'
    //     );
    // }

    // @IsTest
    // private static void functionalGenerateRosterWithExistingDelivery() {
    //     List<ServiceDelivery__c> actualDeliveries;
    //     TestDataFactory.generateAttendanceData('Monthly');
    //     ServiceSession__c session = [
    //         SELECT Id, ServiceSchedule__c
    //         FROM ServiceSession__c
    //         LIMIT 1
    //     ];

    //     Test.startTest();
    //     actualDeliveries = service.generateRoster(session.Id);
    //     Test.stopTest();

    //     Integer countParticipants = [
    //         SELECT COUNT()
    //         FROM ServiceParticipant__c
    //         WHERE ServiceSchedule__c = :session.ServiceSchedule__c
    //     ];
    //     System.assert(
    //         countParticipants > 0 &&
    //         countParticipants == actualDeliveries.size(),
    //         'Expected service deliveries returned for each of the participants.'
    //     );

    //     Integer countIds = 0;
    //     Integer countExistingDeliveries = [
    //         SELECT COUNT()
    //         FROM ServiceDelivery__c
    //         WHERE ServiceSession__c = :session.Id
    //     ];

    //     for (ServiceDelivery__c delivery : actualDeliveries) {
    //         if (delivery.Id == null) {
    //             continue;
    //         }
    //         countIds++;
    //     }

    //     System.assert(
    //         countIds > 0 &&
    //         countIds < countParticipants &&
    //         countIds == countExistingDeliveries,
    //         'Expected the Ids of the existing Service Deliveries to be returned.'
    //     );
    // }

    // @IsTest
    // private static void shouldCallDomainToUpsert() {
    //     String methodName = 'upsertServiceDeliveries';
    //     List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();
    //     service.domain = (ServiceDeliveryDomain) domainStub.createMock();

    //     Test.startTest();
    //     service.upsertServiceDeliveries(deliveries);
    //     Test.stopTest();

    //     domainStub.assertCalledWith(
    //         methodName,
    //         List<ServiceDelivery__c>.class,
    //         deliveries
    //     );
    // }

    // @IsTest
    // private static void shouldRollbackAndRethrowDomainException() {
    //     String methodName = 'upsertServiceDeliveries';
    //     List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();
    //     Exception actualException;
    //     Integer dmlLimitBefore;
    //     Integer dmlLimitAfter;
    //     domainStub.withThrowException(methodName, List<ServiceDelivery__c>.class);
    //     service.domain = (ServiceDeliveryDomain) domainStub.createMock();

    //     Test.startTest();
    //     try {
    //         dmlLimitBefore = System.Limits.getDmlStatements();
    //         service.upsertServiceDeliveries(deliveries);
    //     } catch (Exception ex) {
    //         actualException = ex;
    //         dmlLimitAfter = System.Limits.getDmlStatements();
    //     }

    //     Test.stopTest();

    //     System.assert(
    //         actualException instanceof ServiceDeliveryService.ServiceDeliveryException,
    //         'Expected the service to catch and rethrow the exception.'
    //     );

    //     System.assertEquals(
    //         2,
    //         dmlLimitAfter - dmlLimitBefore,
    //         'Expected a dml statement for the save point and the rollback.'
    //     );

    //     domainStub.assertCalledWith(
    //         methodName,
    //         List<ServiceDelivery__c>.class,
    //         deliveries
    //     );
    // }

    // @IsTest
    // private static void shouldCallPermissionValidator() {
    //     String fieldAccessMethodName = 'hasFLSAccessForFields';
    //     String objectAccessMethodName = 'hasObjectAccess';

    //     permValidatorStub.withReturnValue(
    //         objectAccessMethodName,
    //         new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
    //         true
    //     );
    //     permValidatorStub.withReturnValue(
    //         fieldAccessMethodName,
    //         new List<Type>{ List<Schema.SObjectField>.class, String.class },
    //         true
    //     );
    //     PermissionValidator.instance = (PermissionValidator) permValidatorStub.createMock();

    //     Map<String, Boolean> expected = new Map<String, Boolean>{
    //         'read' => true,
    //         'write' => true
    //     };

    //     Test.startTest();
    //     Map<String, Boolean> actual = service.checkFieldPermissions();
    //     Test.stopTest();

    //     permValidatorStub.assertCalled(
    //         fieldAccessMethodName,
    //         new List<Type>{ List<Schema.SObjectField>.class, String.class }
    //     );
    //     permValidatorStub.assertCalled(
    //         objectAccessMethodName,
    //         new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class }
    //     );
    //     System.assertEquals(
    //         expected,
    //         actual,
    //         'Field permissions not returned from Perm Validator as expected.'
    //     );
    // }

    private static ServiceDelivery__c createMockDelivery() {
        return new ServiceDelivery__c(
            Id = TestUtil.mockId(ServiceDelivery__c.SObjectType),
            Contact__c = TestUtil.mockId(Contact.SObjectType),
            ProgramEngagement__c = TestUtil.mockId(ProgramEngagement__c.SObjectType),
            Service__c = TestUtil.mockId(Service__c.SObjectType),
            ServiceSession__c = TestUtil.mockId(ServiceSession__c.SObjectType),
            Quantity__c = 3,
            AttendanceStatus__c = 'Attended'
        );
    }

    private static ServiceParticipant__c createMockParticipant() {
        return new ServiceParticipant__c(
            Id = TestUtil.mockId(ServiceParticipant__c.SObjectType),
            Contact__c = TestUtil.mockId(Contact.SObjectType),
            ProgramEngagement__c = TestUtil.mockId(ProgramEngagement__c.SObjectType)
        );
    }
}
