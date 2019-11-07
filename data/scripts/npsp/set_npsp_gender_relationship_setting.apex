final npe4__Relationship_Settings__c relationshipSetting = npe4__Relationship_Settings__c.getInstance(UserInfo.getOrganizationId());
{
    relationshipSetting.npe4__Gender_Field__c = Schema.SObjectType.Contact.fields.Gender__c.getName();
}
update relationshipSetting;