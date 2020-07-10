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
    public FieldSetService() {
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
        String fieldSetName
    ) {
        Map<String, Map<String, Object>> fieldByApiName = new Map<String, Map<String, Object>>();
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

        for (Schema.FieldSetMember field : fieldSet.fields) {
            if (
                unsupportedFieldTypes.contains(field.getType().name()) ||
                field.getFieldPath().contains('.')
            ) {
                // Skipping unsupported field types and fields from related objects.
                // NOTE: If we ever determine we want to allow reference fields
                // we can overload this method with a Boolean flag
                continue;
            }

            DescribeFieldResult fieldDescribe = field.getSObjectField().getDescribe();
            fieldDescribe = getCompoundFieldDescribe(objectDescribe, fieldDescribe);

            fieldByApiName.put(fieldDescribe.getName(), getFieldForLWC(fieldDescribe));
        }

        return fieldByApiName.values();
    }

    /**
     * @description Lightning Record Form handles splitting up the compound fields and in the case of
     * a Geolocation field does not handle the field split. Field Sets do not allow for the compound field
     * to be added so we need to extract it from the SObjectDescribe
     * @param DescribeSObjectResult objectDescribe
     * @param DescribeFieldResult fieldDescribe
     * @return      DescribeFieldResult
     */
    @TestVisible
    private DescribeFieldResult getCompoundFieldDescribe(
        DescribeSObjectResult objectDescribe,
        DescribeFieldResult fieldDescribe
    ) {
        String compoundFieldName = fieldDescribe.getCompoundFieldName();
        return compoundFieldName == null
            ? fieldDescribe
            : objectDescribe.fields.getMap().get(compoundFieldName).getDescribe();
    }

    /**
     * @description "Casts" a FieldSetMember into a Map<String, Object> with 'apiName' and 'label', etc. keys.
     * An array of these is used by a Lightning Web Component to leverage an admin-controlled field set.
     *
     * @param field FieldSetMember
     * @return      Map<String, Object>
     */
    @TestVisible
    private Map<String, Object> getFieldForLWC(DescribeFieldResult field) {
        return new Map<String, Object>{
            'apiName' => field.getName(),
            'label' => getLabel(field),
            'type' => field.getType().name(),
            'isRequired' => !field.isNillable(),
            'helpText' => field.getInlineHelpText(),
            'isAccessible' => field.isAccessible()
        };
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
}
