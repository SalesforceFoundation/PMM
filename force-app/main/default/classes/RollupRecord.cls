public with sharing class RollupRecord {
    public Id recordId;
    private Integer presentCount;
    private Integer absentCount;
    private Integer consecutiveCount;
    private Integer totalRecords;
    private Integer totalProcessed;
    private Date lastServiceDate;
    SObjectField numAbsentField;
    SObjectField numPresentField;
    SObjectField consecutiveAbsencesField;
    SObjectField lastServiceDateField;

    public RollupRecord(Id recordId) {
        this.recordId = recordId;
        this.totalProcessed = 0;
    }

    public Boolean getIsProcessed() {
        return totalRecords == null || totalProcessed >= totalRecords;
    }

    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }

    public void rollupFields(
        SObjectField numAbsentField,
        SObjectField numPresentField,
        SObjectField consecutiveAbsencesField,
        SObjectField lastServiceDateField
    ) {
        this.numAbsentField = numAbsentField;
        this.numPresentField = numPresentField;
        this.consecutiveAbsencesField = consecutiveAbsencesField;
        this.lastServiceDateField = lastServiceDateField;
    }

    public void incrementProcessed() {
        totalProcessed++;
    }

    public void incrementPresentCount() {
        if (numPresentField == null) {
            return;
        }

        presentCount = presentCount == null ? 1 : presentCount + 1;
        absentCount = absentCount == null ? 0 : absentCount;
        consecutiveCount = 0;
    }

    public void incrementAbsentCount() {
        if (numAbsentField == null) {
            return;
        }

        presentCount = presentCount == null ? 0 : presentCount;
        absentCount = absentCount == null ? 1 : absentCount + 1;
        consecutiveCount = consecutiveCount == null ? 1 : consecutiveCount + 1;
    }

    public void updateLastServiceDate(Date deliveryDate) {
        if (lastServiceDateField == null) {
            return;
        }

        lastServiceDate = lastServiceDate == null ||
            lastServiceDate < deliveryDate
            ? deliveryDate
            : lastServiceDate;
    }

    public Boolean isModified(SObject originalRecord) {
        Boolean isModified = false;

        isModified =
            (numPresentField != null &&
            originalRecord.get(numPresentField) != presentCount) ||
            (numAbsentField != null &&
            originalRecord.get(numAbsentField) != absentCount) ||
            (consecutiveAbsencesField != null &&
            originalRecord.get(consecutiveAbsencesField) != consecutiveCount) ||
            (lastServiceDateField != null &&
            originalRecord.get(lastServiceDateField) != lastServiceDate);

        return isModified;
    }

    public SObject getSObject() {
        SObject sObj = recordId.getSObjectType().newSObject(recordId);

        if (numPresentField != null) {
            sObj.put(numPresentField, presentCount);
        }

        if (numAbsentField != null) {
            sObj.put(numAbsentField, absentCount);
        }

        if (consecutiveAbsencesField != null) {
            sObj.put(consecutiveAbsencesField, consecutiveCount);
        }

        if (lastServiceDateField != null) {
            sObj.put(lastServiceDateField, lastServiceDate);
        }

        return sObj;
    }
}
