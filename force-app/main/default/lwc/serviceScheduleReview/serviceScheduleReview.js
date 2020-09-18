import { LightningElement, api } from "lwc";
import { format } from "c/util";
import REVIEW_RECORDS from "@salesforce/label/c.Review_Records";

const FIRSTSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/6/2020";
const SECONDSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/7/2020";
const THIRDSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/13/2020";
const FOURTHSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/14/2020";
const FIFTHSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/20/2020";
const SIXTHSESSIONNAME = "Family Class (Thu-Fri) Thursday: 7/21/2020";

const SESSION_DATA = [
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

const PARTICIPANT_DATA = [
    {
        id: "1",
        Contact__c: "Arlene Baker",
        Email: "arlene@test.com",
        Stage__c: "Active",
    },
    {
        id: "2",
        Contact__c: "Tom Higgins",
        Email: "thig@test.com",
        Stage__c: "Active",
    },
    {
        id: "3",
        Contact__c: "Robin Brooks",
        Email: "robinbrooks@test.com",
        Stage__c: "Active",
    },
    {
        id: "4",
        Contact__c: "Barbara Johnson",
        Email: "bjohnson@test.com",
        Stage__c: "Active",
    },
    {
        id: "5",
        Contact__c: "Zack Morris",
        Email: "zack@test.com",
        Stage__c: "Active",
    },
];

export default class ServiceScheduleReview extends LightningElement {
    // TODO: ADAPT THESE TO RECEIVE ACTUAL DATA
    // Note: hard-coding for now, will be delivered by a previous screen,
    // which will be responsible for the getObjectInfo wire call
    @api participants = {
        records: PARTICIPANT_DATA,
        label: "Service Participant",
        pluralLabel: "Service Participants",
        fields: {
            Name: { apiName: "Name", label: "Service Participant Name" },
            Contact__c: { apiName: "Contact__c", label: "Contact" },
            Email: { apiName: "Email", label: "Email" }, // this one will need extra love because it's a reference field
            Stage__c: { apiName: "Stage__c", label: "Stage" },
        },
    };
    @api sessions = {
        records: SESSION_DATA,
        label: "Service Session",
        pluralLabel: "Service Sessions",
        fields: {
            Name: { apiName: "Name", label: "Service Session Name" },
            SessionStart__c: { apiName: "SessionStart__c", label: "Session Start" },
            SessionEnd__c: { apiName: "SessionEnd__c", label: "Session End" },
        },
    };
    @api schedule = {
        record: {
            Name: "Family Class (Thu-Fri)",
            PrimaryServiceProvider__c: { Id: "000", Name: "Veronica Mars" },
            OtherServiceProvider__c: { Id: "001", Name: "Kristen Bell" },
            ParticipantCapacity__c: 12,
        },
        label: "Service Schedule",
        pluralLabel: "Service Schedules",
        fields: {
            FirstSessionStart__c: {
                apiName: "FirstSessionStart__c",
                label: "First Session Start",
            },
            FirstSessionEnd__c: {
                apiName: "FirstSessionEnd__c",
                label: "First Session End",
            },
            PrimaryServiceProvider__c: {
                apiName: "PrimaryServiceProvider__c",
                label: "Primary Service Provider",
            },
            OtherServiceProvider__c: {
                apiName: "OtherServiceProvider__c",
                label: "Other Service Provider",
            },
            ParticipantCapacity__c: {
                apiName: "ParticipantCapacity__c",
                label: "Participant Capacity",
            },
        },
    };

    get reviewLabel() {
        return format(REVIEW_RECORDS, [this.schedule.label]);
    }

    get sessionDataTableColumns() {
        return [
            {
                label: this.sessions.fields.Name.label,
                fieldName: this.sessions.fields.Name.apiName,
                hideDefaultActions: true,
            },
            {
                label: this.sessions.fields.SessionStart__c.label,
                fieldName: this.sessions.fields.SessionStart__c.apiName,
                hideDefaultActions: true,
            },
            {
                label: this.sessions.fields.SessionEnd__c.label,
                fieldName: this.sessions.fields.SessionEnd__c.apiName,
                hideDefaultActions: true,
            },
        ];
    }

    get participantDataTableColumns() {
        return [
            {
                label: this.participants.fields.Contact__c.label,
                fieldName: this.participants.fields.Contact__c.apiName,
                hideDefaultActions: true,
            },
            {
                label: this.participants.fields.Email.label,
                fieldName: this.participants.fields.Email.apiName,
                hideDefaultActions: true,
            },
            {
                label: this.participants.fields.Stage__c.label,
                fieldName: this.participants.fields.Stage__c.apiName,
                hideDefaultActions: true,
            },
        ];
    }

    get lastSessionEndDateTime() {
        return new Date([...this.sessions.records].pop().SessionEnd__c);
    }

    get firstSessionStartDateTime() {
        return new Date(this.sessions.records[0].SessionStart__c);
    }

    get activeSections() {
        return ["participants", "sessions"];
    }
}
