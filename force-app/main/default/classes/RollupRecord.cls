public with sharing class RollupRecord {
    public Id recordId;
    public Boolean increment = true;
    private SObject originalRecord;
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

    public void initialize(SObject originalRecord) {
        this.originalRecord = originalRecord;

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
    }

    public void addOriginalDelivery(ServiceDelivery delivery) {
        if (originalDeliveries == null) {
            originalDeliveries = new List<ServiceDelivery>();
        }

        originalDeliveries.add(delivery);
    }

    public void addDelivery(ServiceDelivery delivery) {
        if (deliveries == null) {
            deliveries = new List<ServiceDelivery>();
        }

        deliveries.add(delivery);
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

    public void process(String childRelationshipName) {
        if (originalDeliveries != null) {
            processUpdates(childRelationshipName);
            return;
        }

        Boolean reprocessLastServiceDate = false;
        Boolean reprocessConsecutiveAbsences = false;

        for (ServiceDelivery delivery : deliveries) {
            if (delivery.isPresent()) {
                reprocessConsecutiveAbsences = true;
                if (!increment) {
                    decrementPresent();
                } else {
                    incrementPresent();
                }
            } else if (delivery.isAbsent()) {
                reprocessConsecutiveAbsences = true;
                if (!increment) {
                    decrementAbsent();
                } else {
                    incrementAbsent();
                }
            }
            // Last Service Date is only on Contact and Program Engagement no need to check
            if (lastServiceDateField == null) {
                continue;
            }

            if (delivery.isDelivered()) {
                if (
                    increment && delivery.getDeliveryDate() > lastServiceDate ||
                    lastServiceDate == null
                ) {
                    lastServiceDate = delivery.getDeliveryDate();
                } else if (!increment && delivery.getDeliveryDate() == lastServiceDate) {
                    lastServiceDate = null;
                    reprocessLastServiceDate = true;
                }
            }
        }

        if (reprocessLastServiceDate || reprocessConsecutiveAbsences) {
            reprocessOriginalDeliveries(
                reprocessLastServiceDate,
                reprocessConsecutiveAbsences,
                childRelationshipName
            );
        }
    }

    // if status changed from present to absent --present and ++absent
    // if status changed from absent to present --absent and ++ present
    // if status changed from absent to neither present nor absent --absent
    // if status changed from present to neither present nor absent --present
    // if status changed from neither to present ++present
    // if status changed from neither to absent ++absent
    // if qty changed from no qty to qty verify last service date
    // if qty changed from qty to no qty verify last service date
    // if delivery date changed and qty is greater than 0, verify last service date
    public void processUpdates(String childRelationshipName) {
        Map<Id, ServiceDelivery> originalDeliveryById = new Map<Id, ServiceDelivery>();
        for (ServiceDelivery originalDelivery : originalDeliveries) {
            originalDeliveryById.put(originalDelivery.getId(), originalDelivery);
        }
        Boolean reprocessLastServiceDate = false;
        Boolean reprocessConsecutiveAbsences = false;

        for (ServiceDelivery delivery : deliveries) {
            ServiceDelivery originalDelivery = originalDeliveryById.get(delivery.getId());
            if (originalDelivery == null) {
                continue; // Skip the record this state should not exist
            }

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

        reprocessOriginalDeliveries(
            reprocessLastServiceDate,
            reprocessConsecutiveAbsences,
            childRelationshipName
        );
    }

    private void reprocessOriginalDeliveries(
        Boolean reprocessLastServiceDate,
        Boolean reprocessConsecutiveAbsences,
        String childRelationshipName
    ) {
        if (consecutiveAbsencesField == null && lastServiceDateField == null) {
            return;
        }

        reprocessLastServiceDate =
            reprocessLastServiceDate && lastServiceDateField != null;
        reprocessConsecutiveAbsences =
            reprocessConsecutiveAbsences && consecutiveAbsencesField != null;

        List<ServiceDelivery__c> childDeliveries = (List<ServiceDelivery__c>) originalRecord.getSObjects(
            childRelationshipName
        );

        if (childDeliveries == null) {
            return;
        }

        for (ServiceDelivery__c record : childDeliveries) {
            ServiceDelivery delivery = new ServiceDelivery(record);
            if (reprocessLastServiceDate && delivery.isDelivered()) {
                lastServiceDate = delivery.getDeliveryDate();
                reprocessLastServiceDate = false;
            }

            if (!reprocessConsecutiveAbsences) {
                continue;
            }

            if (delivery.isPresent()) {
                lastPresentDate = delivery.getDeliveryDate();

                for (
                    Integer index = consecutiveAbsenceDates.size() - 1;
                    index >= 0;
                    index--
                ) {
                    if (consecutiveAbsenceDates[index] <= lastPresentDate) {
                        consecutiveAbsenceDates.remove(index);
                    }
                }

                consecutiveCount = consecutiveAbsenceDates.size();
                reprocessConsecutiveAbsences = false;
            } else if (delivery.isAbsent()) {
                consecutiveAbsenceDates.add(delivery.getDeliveryDate());
            }
        }
    }

    public void incrementPresent() {
        if (numPresentField == null) {
            return;
        }

        presentCount = presentCount == null ? 1 : presentCount + 1;
        absentCount = absentCount == null ? 0 : absentCount;
    }

    public void incrementAbsent() {
        if (numAbsentField == null) {
            return;
        }

        presentCount = presentCount == null ? 0 : presentCount;
        absentCount = absentCount == null ? 1 : absentCount + 1;
    }

    public void decrementPresent() {
        if (presentCount == null || numPresentField == null) {
            return;
        }

        presentCount--;
        resetAttendanceFields();
    }

    public void decrementAbsent() {
        if (absentCount == null || numAbsentField == null) {
            return;
        }

        absentCount--;
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

    public void processPresent(Date presentDate) {
        incrementPresent();

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
        incrementAbsent();

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
