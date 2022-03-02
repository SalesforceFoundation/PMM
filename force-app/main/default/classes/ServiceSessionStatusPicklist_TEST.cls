/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceSessionStatusPicklist_TEST {
    private static List<Schema.PicklistEntry> statusPicklistEntries = ServiceSession__c.Status__c.getDescribe()
        .getPicklistValues();

    @IsTest
    private static void testGetDefaultValue() {
        ServiceSessionStatusPicklist servSeshPicklist = new ServiceSessionStatusPicklist();

        VisualEditor.DataRow defaultDataRow = servSeshPicklist.getDefaultValue();
        System.AssertEquals(
            ServiceSessionService.COMPLETE,
            defaultDataRow.getValue(),
            'Default value should be Complete option'
        );

        // remove the "Complete" option to test the edge case where customer has removed the complete option
        for (Integer i = 0; i < servSeshPicklist.statusPicklistEntries.size(); i++) {
            if (
                servSeshPicklist.statusPicklistEntries[i].getValue() ==
                ServiceSessionService.COMPLETE
            ) {
                servSeshPicklist.statusPicklistEntries.remove(i);
            }
        }

        defaultDataRow = servSeshPicklist.getDefaultValue();
        System.AssertEquals(
            '',
            defaultDataRow.getValue(),
            'When complete option is absent, default value should be blank'
        );
    }

    @IsTest
    private static void testGetPicklistValues() {
        ServiceSessionStatusPicklist servSeshPicklist = new ServiceSessionStatusPicklist();
        VisualEditor.DynamicPickListRows plRows = servSeshPicklist.getValues();

        System.AssertEquals(
            plRows.size(),
            statusPicklistEntries.size(),
            'The number of picklist options returned to the flexipage should match the sobject picklist'
        );

        for (VisualEditor.DataRow dataRow : plRows.getDataRows()) {
            System.Assert(
                picklistIncludes(dataRow),
                'The visual editor rows contain an entry (' +
                dataRow.getLabel() +
                ', ' +
                dataRow.getValue() +
                ') that was not found in the sobject picklist'
            );
        }
    }

    private static Boolean picklistIncludes(VisualEditor.DataRow dataRow) {
        for (Schema.PicklistEntry ple : statusPicklistEntries) {
            if (
                (ple.getValue() == dataRow.getValue()) &&
                (ple.getLabel() == dataRow.getLabel())
            ) {
                return true;
            }
        }
        return false;
    }
}
