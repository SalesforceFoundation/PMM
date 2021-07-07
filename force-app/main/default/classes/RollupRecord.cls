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
    @TestVisible
    private List<ServiceDelivery> deliveries;
    @TestVisible
    private List<ServiceDelivery> originalDeliveries;
    @TestVisible
    private List<ServiceDelivery> existingDeliveries;

    public RollupRecord(Id recordId) {
        this.recordId = recordId;
        this.totalProcessed = 0;
        this.consecutiveAbsenceDates = new List<Date>();
    }

    ////////// Shared //////////
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

    private void incrementPresent() {
        if (numPresentField == null) {
            return;
        }

        presentCount = presentCount == null ? 1 : presentCount + 1;
        absentCount = absentCount == null ? 0 : absentCount;
    }

    private void incrementAbsent() {
        if (numAbsentField == null) {
            return;
        }

        presentCount = presentCount == null ? 0 : presentCount;
        absentCount = absentCount == null ? 1 : absentCount + 1;
    }

    @TestVisible
    private void decrementPresent() {
        if (numPresentField == null) {
            return;
        }

        if (presentCount > 0) {
            presentCount--;
        }
        resetAttendanceFields();
    }

    @TestVisible
    private void decrementAbsent() {
        if (numAbsentField == null) {
            return;
        }

        if (absentCount > 0) {
            absentCount--;
        }
        resetAttendanceFields();
    }

    private void resetAttendanceFields() {
        if (presentCount > 0 || absentCount > 0) {
            return;
        }

        presentCount = null;
        absentCount = null;
        consecutiveCount = null;
    }

    private void updateConsecutiveAbsenceDates() {
        for (Integer i = consecutiveAbsenceDates.size() - 1; i >= 0; i--) {
            if (consecutiveAbsenceDates[i] <= lastPresentDate) {
                consecutiveAbsenceDates.remove(i);
            }
        }
    }

    ////////// Batch Mode //////////
    public Boolean getIsProcessed() {
        return totalRecords == null || totalProcessed >= totalRecords;
    }

    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }

    public void process(ServiceDelivery delivery) {
        incrementProcessed();

        if (delivery.isPresent()) {
            processPresent(delivery.getDeliveryDate());
        } else if (delivery.isAbsent()) {
            processAbsent(delivery.getDeliveryDate());
        }
        //Last Service Date
        if (delivery.isDelivered()) {
            processLastServiceDate(delivery.getDeliveryDate());
        }
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

    @TestVisible
    private void incrementProcessed() {
        totalProcessed++;
    }

    @TestVisible
    private void processPresent(Date presentDate) {
        incrementPresent();

        if (lastPresentDate == null || presentDate > lastPresentDate) {
            lastPresentDate = presentDate;
            updateConsecutiveAbsenceDates();
        }

        consecutiveCount = consecutiveAbsenceDates.size();
    }

    @TestVisible
    private void processAbsent(Date absentDate) {
        incrementAbsent();

        if (lastPresentDate == null || lastPresentDate < absentDate) {
            consecutiveAbsenceDates.add(absentDate);
            consecutiveCount = consecutiveAbsenceDates.size();
        }
    }

    @TestVisible
    private void processLastServiceDate(Date deliveryDate) {
        if (lastServiceDateField == null) {
            return;
        }

        lastServiceDate = lastServiceDate == null ||
            lastServiceDate < deliveryDate
            ? deliveryDate
            : lastServiceDate;
    }

    ////////// Trigger Mode //////////
    public void initialize(SObject originalRecord, String childRelationshipName) {
        if (numPresentField != null) {
            presentCount = Integer.valueOf(originalRecord.get(numPresentField));
        }

        if (numAbsentField != null) {
            absentCount = Integer.valueOf(originalRecord.get(numAbsentField));
        }

        if (consecutiveAbsencesField != null) {
            consecutiveCount = Integer.valueOf(
                originalRecord.get(consecutiveAbsencesField)
            );
        }

        if (lastServiceDateField != null) {
            lastServiceDate = (Date) originalRecord.get(lastServiceDateField);
        }

        if (consecutiveAbsencesField == null || lastServiceDateField == null) {
            return;
        }

        existingDeliveries = new List<ServiceDelivery>();
        List<ServiceDelivery__c> childDeliveries = (List<ServiceDelivery__c>) originalRecord.getSObjects(
            childRelationshipName
        );

        if (childDeliveries == null) {
            return;
        }

        for (ServiceDelivery__c delivery : childDeliveries) {
            existingDeliveries.add(new ServiceDelivery(delivery));
        }
    }

    public void addDelivery(ServiceDelivery delivery) {
        if (deliveries == null) {
            deliveries = new List<ServiceDelivery>();
        }

        deliveries.add(delivery);
    }

    public void addOriginalDelivery(ServiceDelivery delivery) {
        if (originalDeliveries == null) {
            originalDeliveries = new List<ServiceDelivery>();
        }

        originalDeliveries.add(delivery);
    }

    public void process() {
        if (originalDeliveries != null && deliveries != null) {
            processUpdates();
            return;
        }

        Boolean isNew = originalDeliveries == null;
        Boolean reprocessLastServiceDate = false;
        Boolean reprocessConsecutiveAbsences = false;
        List<ServiceDelivery> deliveriesToProcess = isNew
            ? deliveries
            : originalDeliveries;

        for (ServiceDelivery delivery : deliveriesToProcess) {
            if (delivery.isPresent()) {
                reprocessConsecutiveAbsences = true;
                if (isNew) {
                    incrementPresent();
                } else {
                    decrementPresent();
                }
            } else if (delivery.isAbsent()) {
                reprocessConsecutiveAbsences = true;
                if (isNew) {
                    incrementAbsent();
                } else {
                    decrementAbsent();
                }
            }
            // Last Service Date is only on Contact and Program Engagement no need to check
            // when the field is not present
            if (lastServiceDateField == null) {
                continue;
            }

            if (delivery.isDelivered()) {
                if (
                    isNew && delivery.getDeliveryDate() > lastServiceDate ||
                    lastServiceDate == null
                ) {
                    lastServiceDate = delivery.getDeliveryDate();
                } else if (!isNew && delivery.getDeliveryDate() == lastServiceDate) {
                    lastServiceDate = null;
                    reprocessLastServiceDate = true;
                }
            }
        }

        if (reprocessLastServiceDate || reprocessConsecutiveAbsences) {
            processExistingDeliveries(
                reprocessLastServiceDate,
                reprocessConsecutiveAbsences
            );
        }
    }

    private void processUpdates() {
        Map<Id, ServiceDelivery> originalDeliveryById = new Map<Id, ServiceDelivery>();
        for (ServiceDelivery originalDelivery : originalDeliveries) {
            originalDeliveryById.put(originalDelivery.getId(), originalDelivery);
        }
        Boolean reprocessLastServiceDate = false;
        Boolean reprocessConsecutiveAbsences = false;

        for (ServiceDelivery delivery : deliveries) {
            ServiceDelivery originalDelivery = originalDeliveryById.get(delivery.getId());

            Boolean deliveryDateChanged =
                delivery.getDeliveryDate() != originalDelivery.getDeliveryDate();

            if (delivery.isAbsent() && !originalDelivery.isAbsent()) {
                incrementAbsent();
                reprocessConsecutiveAbsences = true;

                if (originalDelivery.isPresent()) {
                    decrementPresent();
                }
            }

            if (delivery.isPresent() && !originalDelivery.isPresent()) {
                incrementPresent();
                reprocessConsecutiveAbsences = true;

                if (originalDelivery.isAbsent()) {
                    decrementAbsent();
                }
            }

            if (
                delivery.isDelivered() != originalDelivery.isDelivered() ||
                deliveryDateChanged
            ) {
                reprocessLastServiceDate = true;
            }
        }

        processExistingDeliveries(reprocessLastServiceDate, reprocessConsecutiveAbsences);
    }

    private void processExistingDeliveries(
        Boolean reprocessLastServiceDate,
        Boolean reprocessConsecutiveAbsences
    ) {
        if ((consecutiveAbsencesField == null && lastServiceDateField == null)) {
            return;
        }

        reprocessConsecutiveAbsences =
            reprocessConsecutiveAbsences && consecutiveAbsencesField != null;
        if (reprocessConsecutiveAbsences) {
            consecutiveCount = null;
        }

        reprocessLastServiceDate =
            reprocessLastServiceDate && lastServiceDateField != null;
        if (reprocessLastServiceDate) {
            lastServiceDate = null;
        }

        if (existingDeliveries.isEmpty()) {
            return;
        }

        for (ServiceDelivery delivery : existingDeliveries) {
            if (reprocessLastServiceDate && delivery.isDelivered()) {
                lastServiceDate = delivery.getDeliveryDate();
                reprocessLastServiceDate = false;
            }

            if (!reprocessConsecutiveAbsences) {
                continue;
            }

            if (delivery.isPresent()) {
                lastPresentDate = delivery.getDeliveryDate();
                updateConsecutiveAbsenceDates();
                consecutiveCount = consecutiveAbsenceDates.size();
                reprocessConsecutiveAbsences = false;
            } else if (delivery.isAbsent()) {
                consecutiveAbsenceDates.add(delivery.getDeliveryDate());
            }
        }

        // If there are not any records set to 'present' we need to set the count outside of the for loop
        if (consecutiveCount == null && reprocessConsecutiveAbsences) {
            consecutiveCount = consecutiveAbsenceDates.size();
        }
    }
}
