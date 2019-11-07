
/*
    Importing NPSP Relationships from datasets/test_data.sql does not support
    setting npe4__ReciprocalRelationship__c because npe4__ReciprocalRelationship__c
    is a circular reference looking up to its own object: npe4__Relationship__c.

    Additionally, NPSP automatically creates reciprocal NPSP Relationships in a Trigger
    for npe4__Relationship__c that have a null npe4__ReciprocalRelationship__c.
    Since npe4__ReciprocalRelationship__c is always null, "duplicate" NPSP Relationships
    are created upon import.

    We want to keep only the first NPSP Relationship per Contact per Related Contact since
    the NPSP Relationship Trigger automatically creates Reciprocal Relationships after insert.
    We can detect the first NPSP Relationship by ordering by Name since Name is an Auto-Number.


    Steps:
    ------------------
    (1) De-activate active Relationship Trigger Handlers so TDTM doesn't do any automation
        for the following procedure
    (2) Find and keep first Relationships that we want to keep per Contact per Related Contact.
        Set aside all Relationship IDs we want to delete.
    (3) Update first Relationships' Reciprocal Relationships only from Relationships we want to keep.
    (4) Hard-delete "duplicate" Relationships we want to delete.
    (5) Re-activate active Relationship Trigger Handlers so TDTM automation behaves the same
        as before this script was executed.
*/

final List<npsp__Trigger_Handler__c> activeRelationshipTriggerHandlers = [
    SELECT Id
    FROM npsp__Trigger_Handler__c
    WHERE npsp__Object__c = 'npe4__Relationship__c'
    AND npsp__Active__c = true
];

// De-activate NPSP Relationship Trigger Handlers so we can modify Relationships without automation.
{
    for (npsp__Trigger_Handler__c triggerHandler : activeRelationshipTriggerHandlers) {
        triggerHandler.npsp__Active__c = false;
    }
    update activeRelationshipTriggerHandlers;
}

final Map<Id, Map<Id, Id>> relationshipIdsByContactIdByRelatedContactId = new Map<Id, Map<Id, Id>>();
final List<npe4__Relationship__c> relationshipsToUpdate = new List<npe4__Relationship__c>();
final List<Id> relationshipIdsToDelete = new List<Id>();

for (npe4__Relationship__c relationship : [
    SELECT Id, npe4__Contact__c, npe4__RelatedContact__c
    FROM npe4__Relationship__c
    ORDER BY Name ASC
]) {
    // Get Relationship IDs by Related Contact ID for this relationship's Contact.
    Map<Id, Id> relationshipIdsByRelatedContactId = relationshipIdsByContactIdByRelatedContactId.get(relationship.npe4__Contact__c);

    if (relationshipIdsByRelatedContactId == null) {
        relationshipIdsByRelatedContactId = new Map<Id, Id>();
        relationshipIdsByContactIdByRelatedContactId.put(
            relationship.npe4__Contact__c,
            relationshipIdsByRelatedContactId
        );
    }

    // Keep only Contact's first Relationship per Related Contact.
    if (relationshipIdsByRelatedContactId.get(relationship.npe4__RelatedContact__c) == null) {
        relationshipIdsByRelatedContactId.put(
            relationship.npe4__RelatedContact__c,
            relationship.Id
        );
        relationshipsToUpdate.add(relationship);
    } else {
        relationshipIdsToDelete.add(relationship.Id);
    }
}

// Set reciprocal Relationships from Relationships we want to keep.
for (npe4__Relationship__c relationship : relationshipsToUpdate) {
    relationship.npe4__ReciprocalRelationship__c = relationshipIdsByContactIdByRelatedContactId
        .get(relationship.npe4__RelatedContact__c)
        .get(relationship.npe4__Contact__c);
}

update relationshipsToUpdate;

// Delete "duplicate" Relationships we do not want to keep.
if (!relationshipIdsToDelete.isEmpty()) {
    Database.delete(relationshipIdsToDelete);
    Database.emptyRecycleBin(relationshipIdsToDelete);
}

// Re-activate NPSP Relationship Trigger Handlers
{
    for (npsp__Trigger_Handler__c triggerHandler : activeRelationshipTriggerHandlers) {
        triggerHandler.npsp__Active__c = true;
    }
    update activeRelationshipTriggerHandlers;
}
