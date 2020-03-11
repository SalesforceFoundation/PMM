import { LightningElement, wire, api, track } from "lwc";
import { CurrentPageReference } from "lightning/navigation";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import PROGRAMENGAGEMENT_OBJECT from "@salesforce/schema/ProgramEngagement__c";
import CONTACT_FIELD from "@salesforce/schema/ProgramEngagement__c.Contact__c";

import { handleError, showToast } from "c/util";
import newProgramEngagement from "@salesforce/label/c.New_Program_Engagement";
import cancel from "@salesforce/label/c.Cancel";
import success from "@salesforce/label/c.Success";
import saveMessage from "@salesforce/label/c.SaveMessage";
import save from "@salesforce/label/c.Save";

export default class NewProgramEngagement extends LightningElement {
    /*@api
    get fieldSet() {
        return this.localFieldSet;
    }
    set fieldSet(value) {
        this.localFieldSet = value;
    }*/

    fields = {
        contact: CONTACT_FIELD,
    };
    @api recordId;
    @api contactId;
    @api fieldSet;
    @track localFieldSet = [];

    @wire(CurrentPageReference) pageRef;

    @wire(getFieldSet, {
        objectName: "ProgramEngagement__c",
        fieldSetName: "CreateProgramEngagement",
    })
    wiredFields({ error, data }) {
        if (data) {
            this.fieldSet = data;
        } else if (error) {
            handleError(error);
        }
    }

    labels = { newProgramEngagement, cancel, success, saveMessage, save };
    objectApiName = PROGRAMENGAGEMENT_OBJECT;

    @api
    showModal() {
        this.template.querySelector("c-modal").show();
    }

    @api
    hideModal() {
        this.template.querySelector("c-modal").hide();
    }

    handleClose() {
        this.hideModal();
    }

    handleSave() {
        this.template.querySelector("lightning-record-edit-form").submit();
        showToast(this.labels.success, this.labels.saveMessage, "success", "dismissible");
        this.hideModal();
    }

    defaultContactLookup() {
        console.log("fieldSet : " + JSON.stringify(this.fieldSet));
        if (this.fieldSet) {
            console.log("this.fieldSet : " + JSON.stringify(this.fieldSet));
            this.localFieldSet = [...this.fieldSet];
            console.log("this.fieldSet mutable : " + JSON.stringify(this.localFieldSet));
            this.localFieldSet.forEach(element => {
                console.log("element : " + JSON.stringify(element));
                if (element.apiName === "Stage__c") {
                    //console.log("element : " + JSON.stringify(element));
                    element.value = "Enrolled";
                    //console.log("element : " + JSON.stringify(element));
                }
                //this.localFieldSet.push(element);
            });
            /*let test = [...this.fieldSet]
                .map(element => ({ ...element }))
                .forEach(element => {
                    if (element.apiName === "Stage__c") {
                        //console.log("element : " + JSON.stringify(element));
                        //element.value = "Enrolled";
                        //console.log("element : " + JSON.stringify(element));
                    }
                    /*if (element.apiName === this.fields.contact.fieldApiName) {
                        console.log("element : " + JSON.stringify(element));
                        element.value = this.contactId;
                        console.log("element : " + JSON.stringify(element));
                    }
                });*/
            console.log("test : " + JSON.stringify(this.test));
        }
    }

    renderedCallback() {
        console.log("renderedcallback");
        this.defaultContactLookup();
    }
}
