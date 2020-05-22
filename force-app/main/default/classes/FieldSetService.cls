/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class FieldSetService {
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
        List<Map<String, Object>> fields = new List<Map<String, Object>>();

        Schema.FieldSet fieldSet;

        Map<String, FieldSet> fieldSetMap = Schema.describeSObjects(
                new List<String>{ objectName }
            )[0]
            .fieldSets.getMap();
        for (String key : fieldSetMap.keySet()) {
            if (key.containsIgnoreCase(fieldSetName)) {
                // temporary workaround for namespacing until design parameter definition is implemented
                fieldSet = fieldSetMap.get(key);
            }
        }

        for (Schema.FieldSetMember field : fieldSet.fields) {
            fields.add(getFieldForLWC(field));
        }

        return fields;
    }

    /**
     * @description "Casts" a FieldSetMember into a Map<String, Object> with 'apiName' and 'label', etc. keys.
     * An array of these is used by a Lightning Web Component to leverage an admin-controlled field set.
     *
     * @param field FieldSetMember
     * @return      Map<String, Object>
     */
    public Map<String, Object> getFieldForLWC(FieldSetMember field) {
        String label = field.getLabel();

        return new Map<String, Object>{
            'apiName' => field.getFieldPath(),
            'label' => label,
            'type' => field.getType().name(),
            'isRequired' => !field.getSObjectField().getDescribe().isNillable(),
            'helpText' => field.getSObjectField().getDescribe().getInlineHelpText()
        };
    }
}
