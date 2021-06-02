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
    private Date lastPresentDate;
    @TestVisible
    private List<Date> consecutiveAbsenceDates;
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

    public RollupRecord(Id recordId) {
        this.recordId = recordId;
        this.totalProcessed = 0;
        this.consecutiveAbsenceDates = new List<Date>();
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

    public void processPresent(Date presentDate) {
        if (numPresentField == null) {
            return;
        }

        presentCount = presentCount == null ? 1 : presentCount + 1;
        absentCount = absentCount == null ? 0 : absentCount;

        if (lastPresentDate == null || presentDate > lastPresentDate) {
            lastPresentDate = presentDate;
            updateConsecutiveAbsences();
        }

        consecutiveCount = consecutiveAbsenceDates.size();
    }

    private void updateConsecutiveAbsences() {
        if (consecutiveAbsenceDates.isEmpty()) {
            return;
        }

        for (Integer i = consecutiveAbsenceDates.size() - 1; i >= 0; i--) {
            if (consecutiveAbsenceDates[i] <= lastPresentDate) {
                consecutiveAbsenceDates.remove(i);
            }
        }
    }

    public void processAbsent(Date absentDate) {
        if (numAbsentField == null) {
            return;
        }

        presentCount = presentCount == null ? 0 : presentCount;
        absentCount = absentCount == null ? 1 : absentCount + 1;

        if (lastPresentDate == null || lastPresentDate < absentDate) {
            consecutiveAbsenceDates.add(absentDate);
            consecutiveCount = consecutiveAbsenceDates.size();
        }
    }

    public void processLastServiceDate(Date deliveryDate) {
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
