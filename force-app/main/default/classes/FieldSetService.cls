/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class FieldSetService {
    @TestVisible
    private Set<String> unsupportedFieldTypes = new Set<String>{ 'TIME' };

    public Map<String, Object> getFieldSetsByName(String objectName) {
        SObjectType sObjectType = Schema.getGlobalDescribe().get(objectName);

        return getFieldSetsByName(sObjectType);
    }

    private Map<String, Object> getFieldSetsByName(SObjectType sObjectType) {
        Map<String, FieldSet> fieldSets = sObjectType.getDescribe().fieldSets.getMap();
        Map<String, Object> fieldSetByName = new Map<String, Object>();

        for (FieldSet fieldSet : fieldSets.values()) {
            Map<String, Map<String, Object>> fieldByApiName = new Map<String, Map<String, Object>>();
            for (
                FieldInfo fieldInfo : getFieldInfos(
                    sObjectType.getDescribe(),
                    fieldSet,
                    false
                )
            ) {
                fieldByApiName.put(
                    fieldInfo.getDescribe().getName(),
                    fieldInfo.getFieldForLWC()
                );
            }

            fieldSetByName.put(fieldSet.getName(), fieldByApiName.values());
        }

        return fieldSetByName;
    }

    public Map<String, Map<String, Object>> getFieldByFieldPath(
        String objectName,
        String fieldSetName
    ) {
        Map<String, Map<String, Object>> fieldByFieldPath = new Map<String, Map<String, Object>>();
        DescribeSObjectResult objectDescribe = Schema.describeSObjects(
            new List<String>{ objectName }
        )[0];
        Schema.FieldSet fieldSet = getFieldSet(objectDescribe, fieldSetName);
        if (fieldSet == null) {
            return fieldByFieldPath;
        }

        for (Schema.FieldSetMember memberField : fieldSet.fields) {
            FieldInfo fieldSetField = new FieldInfo(memberField);

            fieldByFieldPath.put(
                memberField.getFieldPath(),
                fieldSetField.getFieldForLWC()
            );
        }

        return fieldByFieldPath;
    }

    /**
     * @description "Casts" a FieldSet into a List<Map<String, Object>> with 'apiName', 'label', etc keys.
     * This is used by a Lightning Web Component to leverage an admin-controlled field set.
     * @param string objectName
     * @param string fieldSetName
     * @return      List<Map<String, Object>> list of fields, each with apiName, label, etc keys
     */
    public List<Map<String, Object>> getFieldSetForLWC(
        String objectName,
        String fieldSetName,
        Boolean allowRelationshipFields
    ) {
        Map<String, Map<String, Object>> fieldByApiName = new Map<String, Map<String, Object>>();
        for (
            FieldInfo fieldInfo : getFieldInfos(
                objectName,
                fieldSetName,
                allowRelationshipFields
            )
        ) {
            fieldByApiName.put(
                fieldInfo.getDescribe().getName(),
                fieldInfo.getFieldForLWC()
            );
        }

        return fieldByApiName.values();
    }

    /**
     * @description Combine field set member and describe information for fields in a field set
     * @param DescribeSObjectResult objectDescribe
     * @param FieldSet fieldSet
     * @param Boolean allowRelationshipFields
     * @return      List<FieldInfo> Set of FieldInfo objects
     */

    private List<FieldInfo> getFieldInfos(
        DescribeSObjectResult objectDescribe,
        FieldSet fieldSet,
        Boolean allowRelationshipFields
    ) {
        List<FieldInfo> FieldInfos = new List<FieldInfo>();

        for (Schema.FieldSetMember memberField : fieldSet.fields) {
            if (!fieldTypeIsSupported(memberField, allowRelationshipFields)) {
                // Skipping unsupported field types and fields from related objects.
                // NOTE: If we ever determine we want to allow reference fields
                // we can overload this method with a Boolean flag
                continue;
            }
            FieldInfo fieldSetField = new FieldInfo(memberField);

            DescribeFieldResult fieldDescribe = getCompoundFieldDescribe(
                objectDescribe,
                fieldSetField.getDescribe(),
                memberField.getFieldPath()
            );

            fieldSetField.setDescribe(fieldDescribe);

            FieldInfos.add(fieldSetField);
        }

        return FieldInfos;
    }

    /**
     * @description Combine field set member and describe information for fields in a field set
     * @param String objectName
     * @param String fieldSetName
     * @param Boolean allowRelationshipFields
     * @return      List<FieldInfo> Set of FieldInfo objects
     */
    @TestVisible
    private List<FieldInfo> getFieldInfos(
        String objectName,
        String fieldSetName,
        Boolean allowRelationshipFields
    ) {
        Schema.FieldSet fieldSet;
        DescribeSObjectResult objectDescribe = Schema.describeSObjects(
            new List<String>{ objectName }
        )[0];

        Map<String, FieldSet> fieldSetMap = objectDescribe.fieldSets.getMap();
        for (String key : fieldSetMap.keySet()) {
            if (key.containsIgnoreCase(fieldSetName)) {
                // temporary workaround for namespacing until design parameter definition is implemented
                fieldSet = fieldSetMap.get(key);
            }
        }

        if (fieldSet == null) {
            throw new FieldSetException(
                String.format(
                    System.Label.NoFieldSetFound,
                    new List<String>{ fieldSetName, objectName }
                )
            );
        }

        return getFieldInfos(objectDescribe, fieldSet, allowRelationshipFields);
    }

    private Boolean fieldTypeIsSupported(
        Schema.FieldSetMember memberField,
        Boolean allowRelationshipFields
    ) {
        return !(unsupportedFieldTypes.contains(memberField.getType().name()) ||
        (!allowRelationshipFields && memberField.getFieldPath().contains('.')));
    }

    /**
     * @description Retrieve the field set from the object describe with or without a namespace
     * @param DescribeSObjectResult objectDescribe
     * @param String fieldSetName
     * @return      FieldSet
     */
    public FieldSet getFieldSet(
        DescribeSObjectResult objectDescribe,
        String fieldSetName
    ) {
        Map<String, FieldSet> fieldSetMap = objectDescribe.fieldSets.getMap();
        for (String key : fieldSetMap.keySet()) {
            if (key.containsIgnoreCase(fieldSetName)) {
                // temporary workaround for namespacing until design parameter definition is implemented
                return fieldSetMap.get(key);
            }
        }

        return null;
    }

    /**
     * @description Lightning Record Form handles splitting up the compound fields and in the case of
     * a Geolocation field does not handle the field split. Field Sets do not allow for the compound field
     * to be added so we need to extract it from the SObjectDescribe
     * @param DescribeSObjectResult objectDescribe
     * @param DescribeFieldResult fieldDescribe
     * @param String fieldPath
     * @return      DescribeFieldResult
     */
    @TestVisible
    private DescribeFieldResult getCompoundFieldDescribe(
        DescribeSObjectResult objectDescribe,
        DescribeFieldResult fieldDescribe,
        String fieldPath
    ) {
        String compoundFieldName = fieldDescribe.getCompoundFieldName();
        if (compoundFieldName == null) {
            return fieldDescribe;
        }

        objectDescribe = getObjectDescribe(objectDescribe, fieldPath);

        return objectDescribe.fields.getMap().get(compoundFieldName).getDescribe();
    }

    private DescribeSObjectResult getObjectDescribe(
        DescribeSObjectResult objectDescribe,
        String fieldPath
    ) {
        if (!fieldPath.contains('.')) {
            return objectDescribe;
        }

        String relationshipField = fieldPath.split('\\.')[0].replace('__r', '__c');
        return objectDescribe.fields.getMap()
                .get(relationshipField)
                .getDescribe()
                .getReferenceTo()[0]
            .getDescribe();
    }

    /**
     * @description "Casts" a FieldSetMember into a Map<String, Object> with 'apiName' and 'label', etc. keys.
     * An array of these is used by a Lightning Web Component to leverage an admin-controlled field set.
     *
     * @param field DescribeFieldResult
     * @return      Map<String, Object>
     */
    public Map<String, Object> getFieldForLWC(DescribeFieldResult fieldDescribe) {
        return new FieldInfo(fieldDescribe).getFieldForLWC();
    }

    /**
     * @description "Casts" a FieldSetMember into a Map<String, Object> with 'apiName' and 'label', etc. keys. with picklist values
     * An array of these is used by a Lightning Web Component to leverage an admin-controlled field set.
     *
     * @param field FieldSetMember
     * @return      Map<String, Object>
     */
    public Map<String, Object> getPicklistFieldForLWC(DescribeFieldResult field) {
        Map<String, Object> picklistField = getFieldForLWC(field);

        if (
            field.getType() != Schema.DisplayType.PICKLIST &&
            field.getType() != Schema.DisplayType.MULTIPICKLIST
        ) {
            return picklistField;
        }

        List<Map<String, Object>> picklistValues = new List<Map<String, Object>>();

        for (Schema.PicklistEntry entry : field.getPicklistValues()) {
            picklistValues.add(
                new Map<String, Object>{
                    'active' => entry.active,
                    'defaultValue' => entry.defaultvalue,
                    'label' => entry.label,
                    'value' => entry.value
                }
            );
        }

        picklistField.put('picklistValues', picklistValues);

        return picklistField;
    }

    private class FieldSetException extends Exception {
    }

    @TestVisible
    private class FieldInfo {
        private DescribeFieldResult fieldDescribe;
        private Schema.FieldSetMember fieldSetMember;

        public FieldInfo(DescribeFieldResult dfr, Schema.FieldSetMember fsm) {
            fieldDescribe = dfr;
            fieldSetMember = fsm;
        }

        public FieldInfo(DescribeFieldResult dfr) {
            this(dfr, null);
        }

        public FieldInfo(Schema.FieldSetMember fsm) {
            this(fsm.getSObjectField().getDescribe(), fsm);
        }

        public DescribeFieldResult getDescribe() {
            return fieldDescribe;
        }

        public void setDescribe(DescribeFieldResult dfr) {
            fieldDescribe = dfr;
        }

        public Boolean isRequired() {
            Boolean isRequiredOnFieldSet = fieldSetMember != null
                ? fieldSetMember.getRequired()
                : false;
            Boolean isRequiredOnDescribe = fieldDescribe.getType() ==
                Schema.DisplayType.BOOLEAN
                ? false
                : !fieldDescribe.isNillable();
            return isRequiredOnDescribe || isRequiredOnFieldSet;
        }

        /**
         * @description "Casts" a FieldSetMember into a Map<String, Object> with 'apiName' and 'label', etc. keys.
         * An array of these is used by a Lightning Web Component to leverage an admin-controlled field set.
         *
         * @return      Map<String, Object>
         */
        public Map<String, Object> getFieldForLWC() {
            return new Map<String, Object>{
                'apiName' => fieldDescribe.getName(),
                'label' => getLabel(),
                'type' => fieldDescribe.getType().name(),
                'isRequired' => isRequired(),
                'helpText' => fieldDescribe.getInlineHelpText(),
                'isAccessible' => fieldDescribe.isAccessible(),
                'relationshipName' => fieldDescribe.getRelationshipName(),
                'referenceTo' => getReferenceTo(),
                'referenceNameField' => getNameFieldForReferenceField(),
                'isUpdateable' => fieldDescribe.isUpdateable()
            };
        }

        /**
         * @description Standard Salesforce UI has special handling of the label for Standard Reference Fields
         * this method will return the special label
         */
        public String getLabel() {
            String label;

            if (fieldDescribe.getName().equalsIgnoreCase('AccountId')) {
                label = Schema.Account.Name.getDescribe().getLabel();
            } else if (fieldDescribe.getName().equalsIgnoreCase('ContactId')) {
                label = Schema.Contact.Name.getDescribe().getLabel();
            } else if (fieldDescribe.getName().equalsIgnoreCase('OwnerId')) {
                label = System.Label.Owner_Field;
            } else {
                label = fieldDescribe.getLabel();
            }

            return label;
        }

        /**
         * Returns the API name of the "name" field of the object type referenced
         * by this field.  If the field provided is not a lookup field, this method
         * returns null.  If the lookup is polymorphic, then the name field for
         * only one of the referenced types is returned.
         */
        public String getNameFieldForReferenceField() {
            List<Schema.SObjectType> references = fieldDescribe.getReferenceTo();
            if (!references.isEmpty()) {
                Schema.DescribeSObjectResult referencedType = references[0].getDescribe();
                Map<String, Schema.SObjectField> fields = referencedType.fields.getMap();
                for (Schema.SObjectField referenceField : fields.values()) {
                    Schema.DescribeFieldResult referenceFieldDescribe = referenceField.getDescribe();
                    if (referenceFieldDescribe.isNameField()) {
                        return referenceFieldDescribe.getName();
                    }
                }
            }

            return null;
        }

        public String getReferenceTo() {
            String reference;

            if (fieldDescribe.getReferenceTo().isEmpty()) {
                return null;
            } else {
                return fieldDescribe.getReferenceTo()[0].getDescribe().getName();
            }
        }
    }
}
