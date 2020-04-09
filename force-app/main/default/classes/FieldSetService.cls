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
     * @description "Casts" a FieldSet into a List<Map<String, Object>> with 'apiName' and 'label' keys.
     * This is used by a Lightning Web Component to leverage an admin-controlled field set.
     * @param string objectName
     * @param string fieldSetName
     * @return      List<Map<String, String>> list of fields, each with apiName and label keys
     */
    public List<Map<String, String>> getFieldSetForLWC(
        String objectName,
        String fieldSetName
    ) {
        List<Map<String, String>> fields = new List<Map<String, String>>();

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
     * @description "Casts" a FieldSetMember into a Map<String, Object> with 'apiName' and 'label' keys.
     * An array of these is used by a Lightning Web Component to leverage an admin-controlled field set.
     *
     * @param field FieldSetMember
     * @return      Map<String, String>
     */
    public Map<String, String> getFieldForLWC(FieldSetMember field) {
        String label = field.getLabel();

        return new Map<String, String>{
            'apiName' => field.getFieldPath(),
            'label' => label
        };
    }
}
