public with sharing class RollupRecord {
    public Id recordId;
    @TestVisible
    private Integer presentCount;
    @TestVisible
    private Integer absentCount;
    @TestVisible
    private Integer consecutiveCount;
    @TestVisible
    private Date lastServiceDate;
    @TestVisible
    private Integer totalRecords;
    @TestVisible
    private Integer totalProcessed;
    @TestVisible
    private SObjectField numAbsentField;
    @TestVisible
    private SObjectField numPresentField;
    @TestVisible
    private SObjectField consecutiveAbsencesField;
    @TestVisible
    private SObjectField lastServiceDateField;
    @TestVisible
    private List<Date> absentDates;

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

    public void processPresent() {
        if (numPresentField == null) {
            return;
        }

        presentCount = presentCount == null ? 1 : presentCount + 1;
        absentCount = absentCount == null ? 0 : absentCount;
    }

    public void processAbsent(Date deliveryDate) {
        if (numAbsentField == null) {
            return;
        }

        presentCount = presentCount == null ? 0 : presentCount;
        absentCount = absentCount == null ? 1 : absentCount + 1;
        absentDates.add(deliveryDate);
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
            consecutiveCount = 0;
            for (Date absentDate : absentDates) {
                if (absentDate > lastServiceDate) {
                    consecutiveCount++;
                }
            }
            sObj.put(consecutiveAbsencesField, consecutiveCount);
        }

        if (lastServiceDateField != null) {
            sObj.put(lastServiceDateField, lastServiceDate);
        }

        return sObj;
    }
}
