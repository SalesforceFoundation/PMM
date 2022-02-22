public class ServiceSessionStatusPicklist extends VisualEditor.DynamicPickList {
    private List<Schema.PicklistEntry> statusPicklistEntries = null;

    public override VisualEditor.DataRow getDefaultValue() {
        return new VisualEditor.DataRow('--None--', '');
    }

    public override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows statusOptions = new VisualEditor.DynamicPickListRows();
        statusOptions.addRow(getDefaultValue());
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
