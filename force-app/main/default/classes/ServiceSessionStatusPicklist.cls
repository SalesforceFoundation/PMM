/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class ServiceSessionStatusPicklist extends VisualEditor.DynamicPickList {
    private static final String COMPLETE = 'Complete';

    @TestVisible
    private List<Schema.PicklistEntry> statusPicklistEntries = null;

    public override VisualEditor.DataRow getDefaultValue() {
        List<Schema.PicklistEntry> ples = getStatusPicklistEntries();
        for (Schema.PicklistEntry ple : ples) {
            if (ple.getValue() == COMPLETE) {
                return new VisualEditor.DataRow(ple.getLabel(), ple.getValue());
            }
        }
        return new VisualEditor.DataRow('--' + System.Label.None + '--', '');
    }

    public override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows statusOptions = new VisualEditor.DynamicPickListRows();
        List<Schema.PicklistEntry> ples = getStatusPicklistEntries();
        for (Schema.PicklistEntry ple : ples) {
            VisualEditor.DataRow pickListEntryRow = new VisualEditor.DataRow(
                ple.getLabel(),
                ple.getValue()
            );
            statusOptions.addRow(pickListEntryRow);
        }
        return statusOptions;
    }

    private List<Schema.PicklistEntry> getStatusPicklistEntries() {
        if (statusPicklistEntries == null) {
            statusPicklistEntries = ServiceSession__c.Status__c.getDescribe()
                .getPicklistValues();
        }

        return statusPicklistEntries;
    }
}
