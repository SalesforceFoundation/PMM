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
                DescribeFieldResult fieldDescribe : getFieldDescribes(
                    sObjectType.getDescribe(),
                    fieldSet,
                    false
                )
            ) {
                fieldByApiName.put(
                    fieldDescribe.getName(),
                    getFieldForLWC(fieldDescribe)
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

        for (Schema.FieldSetMember field : fieldSet.fields) {
            DescribeFieldResult fieldDescribe = field.getSObjectField().getDescribe();

            fieldByFieldPath.put(field.getFieldPath(), getFieldForLWC(fieldDescribe));
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
            DescribeFieldResult fieldDescribe : getFieldDescribes(
                objectName,
                fieldSetName,
                allowRelationshipFields
            )
        ) {
            fieldByApiName.put(fieldDescribe.getName(), getFieldForLWC(fieldDescribe));
        }

        return fieldByApiName.values();
    }

    /**
     * @description "Casts" a FieldSet into a List<DescribeFieldResult>.
     * @param string objectName
     * @param string fieldSetName
     * @return      List<DescribeFieldResult> Set of fields describes
     */
    public List<DescribeFieldResult> getFieldDescribes(
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

        return getFieldDescribes(objectDescribe, fieldSet, allowRelationshipFields);
    }

    private List<DescribeFieldResult> getFieldDescribes(
        DescribeSObjectResult objectDescribe,
        FieldSet fieldSet,
        Boolean allowRelationshipFields
    ) {
        List<DescribeFieldResult> fieldDescribes = new List<DescribeFieldResult>();

        for (Schema.FieldSetMember field : fieldSet.fields) {
            if (
                unsupportedFieldTypes.contains(field.getType().name()) ||
                (!allowRelationshipFields && field.getFieldPath().contains('.'))
            ) {
                // Skipping unsupported field types and fields from related objects.
                // NOTE: If we ever determine we want to allow reference fields
                // we can overload this method with a Boolean flag
                continue;
            }

            DescribeFieldResult fieldDescribe = field.getSObjectField().getDescribe();
            fieldDescribe = getCompoundFieldDescribe(
                objectDescribe,
                fieldDescribe,
                field.getFieldPath()
            );

            fieldDescribes.add(fieldDescribe);
        }

        return fieldDescribes;
    }

    /**
     * @description Retrieve the field set from the object describe with or without a namespace
     * @param DescribeSObjectResult objectDescribe
     * @param String fieldSetName
     * @return      FieldSet
     */
    private FieldSet getFieldSet(
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
     * @param field FieldSetMember
     * @return      Map<String, Object>
     */
    public Map<String, Object> getFieldForLWC(DescribeFieldResult field) {
        String referenceObjectName = getReferenceTo(field);
        return new Map<String, Object>{
            'apiName' => field.getName(),
            'label' => getLabel(field),
            'type' => field.getType().name(),
            'isRequired' => field.getType() == Schema.DisplayType.BOOLEAN
                ? false
                : !field.isNillable(),
            'helpText' => field.getInlineHelpText(),
            'isAccessible' => field.isAccessible(),
            'relationshipName' => field.getRelationshipName(),
            'referenceTo' => referenceObjectName,
            'referenceNameField' => getNameFieldForObject(referenceObjectName),
            'isUpdateable' => field.isUpdateable()
        };
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

    /**
     * @description Standard Salesforce UI has special handling of the label for Standard Reference Fields
     * this method will return the special label
     * @param DescribeFieldResult fieldDescribe
     * @return      String
     */
    @TestVisible
    private String getLabel(DescribeFieldResult field) {
        String label;

        if (field.getName().equalsIgnoreCase('AccountId')) {
            label = Schema.Account.Name.getDescribe().getLabel();
        } else if (field.getName().equalsIgnoreCase('ContactId')) {
            label = Schema.Contact.Name.getDescribe().getLabel();
        } else if (field.getName().equalsIgnoreCase('OwnerId')) {
            label = System.Label.Owner_Field;
        } else {
            label = field.getLabel();
        }

        return label;
    }

    @TestVisible
    private String getReferenceTo(DescribeFieldResult field) {
        String reference;

        if (field.getReferenceTo().isEmpty()) {
            return null;
        } else {
            return field.getReferenceTo()[0].getDescribe().getName();
        }
    }

    /**
     * Platform limits the number of reference fields on an object so using this query
     * within a loop of fields with a field set.
     */
    private String getNameFieldForObject(String sObjectApiName) {
        if (sObjectApiName == null) {
            return null;
        }

        List<FieldDefinition> fieldDefinitions = [
            SELECT QualifiedApiName
            FROM FieldDefinition
            WHERE
                EntityDefinition.QualifiedApiName = :sObjectApiName
                AND IsNameField = TRUE
        ];

        return fieldDefinitions.isEmpty() ? null : fieldDefinitions[0].QualifiedApiName;
    }

    private class FieldSetException extends Exception {
    }
}
