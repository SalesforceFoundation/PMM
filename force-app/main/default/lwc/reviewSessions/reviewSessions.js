import { LightningElement, track, wire, api } from "lwc";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { format, createUUID } from "c/util";
import TOTAL_RECORDS_LABEL from "@salesforce/label/c.Total_Records";
import ADD_RECORD_LABEL from "@salesforce/label/c.Add_Record";
import START_TIME_LABEL from "@salesforce/label/c.Start_Time";
import END_TIME_LABEL from "@salesforce/label/c.End_Time";
import REVIEW_RECORDS from "@salesforce/label/c.Review_Records";

import SERVICE_SESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import SESSION_NAME_FIELD from "@salesforce/schema/ServiceSession__c.Name";
import SESSION_START_FIELD from "@salesforce/schema/ServiceSession__c.SessionStart__c";
import SESSION_END_FIELD from "@salesforce/schema/ServiceSession__c.SessionEnd__c";

export default class ReviewSessions extends LightningElement {
    @track columns = [];
    @track data = [];
    @track objectName;

    @api sessionNameLabel;
    @api sessionStartLabel;
    @api sessionEndLabel;

    labels = {
        totalSessions: TOTAL_RECORDS_LABEL,
        addSession: ADD_RECORD_LABEL,
        reviewSessions: REVIEW_RECORDS,
        startTime: START_TIME_LABEL,
        endTime: END_TIME_LABEL,
    };

    @wire(getObjectInfo, { objectApiName: SERVICE_SESSION_OBJECT })
    wireSession(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.setLabels(result.data);
            this.setDataTableColumns(result.data);
        }
    }

    get totalServiceSessions() {
        return format(this.labels.totalSessions, [this.objectName, this.data.length]);
    }

    setLabels(data) {
        this.objectName = data.labelPlural;
        this.labels.addSession = format(this.labels.addSession, [data.label]);

        this.labels.reviewSessions = format(this.labels.reviewSessions, [
            data.labelPlural,
        ]);

        // Below lines of code sets the labels so these could be used while
        // setting the columns on the datatable
        Object.values(data.fields).forEach(element => {
            if (element.apiName === SESSION_NAME_FIELD.fieldApiName) {
                this.sessionNameLabel = element.label;
            }
            if (element.apiName === SESSION_START_FIELD.fieldApiName) {
                this.sessionStartLabel = element.label;
            }
            if (element.apiName === SESSION_END_FIELD.fieldApiName) {
                this.sessionEndLabel = element.label;
            }
        });
    }

    setDataTableColumns() {
        const COLUMNS = [
            {
                label: this.sessionNameLabel,
                fieldName: SESSION_NAME_FIELD.fieldApiName,
                hideDefaultActions: true,
            },
            {
                label: this.sessionStartLabel,
                fieldName: SESSION_START_FIELD.fieldApiName,
                hideDefaultActions: true,
            },
            {
                label: this.sessionEndLabel,
                fieldName: SESSION_END_FIELD.fieldApiName,
                hideDefaultActions: true,
            },
            {
                label: "",
                fieldName: "",
                type: "button-icon",
                hideDefaultActions: true,
                typeAttributes: {
                    iconName: "utility:clear",
                    variant: "bare",
                    iconPosition: "left",
                    disabled: false,
                },
            },
        ];

        this.columns = COLUMNS;
        this.setupDataTableData();
    }

    setupDataTableData() {
        const FIRSTSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/6/2020";
        const SECONDSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/7/2020";
        const THIRDSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/13/2020";
        const FOURTHSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/14/2020";
        const FIFTHSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/20/2020";
        const SIXTHSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/21/2020";

        const DATA = [
            {
                id: "1",
                Name: FIRSTSESSIONNAME,
                SessionStart__c: "7/6/2020 1:00 PM",
                SessionEnd__c: "7/6/2020 3:00 PM",
            },
            {
                id: "2",
                Name: SECONDSESSIONNAME,
                SessionStart__c: "7/7/2020 1:00 PM",
                SessionEnd__c: "7/7/2020 3:00 PM",
            },
            {
                id: "3",
                Name: THIRDSESSIONNAME,
                SessionStart__c: "7/13/2020 1:00 PM",
                SessionEnd__c: "7/13/2020 3:00 PM",
            },
            {
                id: "4",
                Name: FOURTHSESSIONNAME,
                SessionStart__c: "7/14/2020 1:00 PM",
                SessionEnd__c: "7/14/2020 3:00 PM",
            },
            {
                id: "5",
                Name: FIFTHSESSIONNAME,
                SessionStart__c: "7/20/2020 1:00 PM",
                SessionEnd__c: "7/20/2020 3:00 PM",
            },
            {
                id: "6",
                Name: SIXTHSESSIONNAME,
                SessionStart__c: "7/21/2020 1:00 PM",
                SessionEnd__c: "7/21/2020 3:00 PM",
            },
        ];
        this.data = DATA;
    }

    handleAddRows() {
        const dataId = createUUID();
        this.data.push({
            id: dataId,
            Name: "",
            SessionDate__c: "",
            startTime: "",
            endTime: "",
        });

        this.data = this.data.slice(0);
    }

    handleDelete(event) {
        this.data = this.data.filter(element => element.id !== event.detail.row.id);
    }
}
