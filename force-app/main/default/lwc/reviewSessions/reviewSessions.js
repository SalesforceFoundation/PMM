import { LightningElement, track, wire, api } from "lwc";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { format } from "c/util";
import TOTAL_RECORDS_LABEL from "@salesforce/label/c.Total_Records";
import ADD_RECORD_LABEL from "@salesforce/label/c.Add_Records";
import START_TIME_LABEL from "@salesforce/label/c.Start_Time";
import END_TIME_LABEL from "@salesforce/label/c.End_Time";
import REVIEW_RECORDS from "@salesforce/label/c.Review_Records";

import SERVICE_SESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import SESSION_NAME_FIELD from "@salesforce/schema/ServiceSession__c.Name";
import SESSION_DATE_FIELD from "@salesforce/schema/ServiceSession__c.SessionDate__c";

export default class ReviewSessions extends LightningElement {
    @track columns = [];
    @track data = [];

    @api sessionNameLabel;
    @api sessionDateLabel;

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

    get totalSessionCount() {
        if (this.data) {
            return this.data.length;
        }
        return 0;
    }

    setLabels(data) {
        this.labels.totalSessions = format(this.labels.totalSessions, [
            data.labelPlural.split(" ")[1],
        ]);

        this.labels.addSession = format(this.labels.addSession, [
            data.label.split(" ")[1],
        ]);

        this.labels.reviewSessions = format(this.labels.reviewSessions, [
            data.labelPlural.split(" ")[1],
        ]);

        // Below lines of code sets the labels so these could be used while
        // setting the columns on the datatable
        Object.values(data.fields).forEach(element => {
            if (element.apiName === SESSION_NAME_FIELD.fieldApiName) {
                this.sessionNameLabel = element.label;
            }
            if (element.apiName === SESSION_DATE_FIELD.fieldApiName) {
                this.sessionDateLabel = element.label;
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
                label: this.sessionDateLabel,
                fieldName: SESSION_DATE_FIELD.fieldApiName,
                hideDefaultActions: true,
            },
            {
                label: this.labels.startTime,
                fieldName: "startTime",
                hideDefaultActions: true,
            },
            {
                label: this.labels.endTime,
                fieldName: "endTime",
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
        const DATA = [
            {
                id: "1",
                Name: "Family Class (Thu-Fri) Thursday: 7/6/2020",
                SessionDate__c: "7/6/2020",
                startTime: "1:00 PM",
                endTime: "3:00 PM",
            },
            {
                id: "2",
                Name: "Family Class (Thu-Fri) Thursday: 7/7/2020",
                SessionDate__c: "7/7/2020",
                startTime: "1:00 PM",
                endTime: "3:00 PM",
            },
            {
                id: "3",
                Name: "Family Class (Thu-Fri) Thursday: 7/13/2020",
                SessionDate__c: "7/13/2020",
                startTime: "1:00 PM",
                endTime: "3:00 PM",
            },
            {
                id: "4",
                Name: "Family Class (Thu-Fri) Thursday: 7/14/2020",
                SessionDate__c: "7/14/2020",
                startTime: "1:00 PM",
                endTime: "3:00 PM",
            },
            {
                id: "5",
                Name: "Family Class (Thu-Fri) Thursday: 7/20/2020",
                SessionDate__c: "7/20/2020",
                startTime: "1:00 PM",
                endTime: "3:00 PM",
            },
            {
                id: "6",
                Name: "Family Class (Thu-Fri) Thursday: 7/21/2020",
                SessionDate__c: "7/21/2020",
                startTime: "1:00 PM",
                endTime: "3:00 PM",
            },
        ];
        this.data = DATA;
    }

    handleAddRows() {
        this.setupDataTableData();
        this.data.push({
            id: "",
            Name: "",
            SessionDate__c: "",
            startTime: "",
            endTime: "",
        });
    }

    handleDelete(event) {
        this.data = this.data.filter(element => element.id !== event.detail.row.id);
    }
}
