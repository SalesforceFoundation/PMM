import { LightningElement } from "lwc";

import { ProgressSteps } from "c/progressSteps";
import { NavigationItems } from "c/navigationItems";

import groupTitle from "@salesforce/label/c.BSDT_Group_Option_Title";
import groupDesc from "@salesforce/label/c.BSDT_Group_Option_Description";
import groupButton from "@salesforce/label/c.BSDT_Group_Option_Button";
import singleTitle from "@salesforce/label/c.BSDT_Single_Option_Title";
import singleDesc from "@salesforce/label/c.BSDT_Single_Option_Description";
import singleButton from "@salesforce/label/c.BSDT_Single_Option_Button";
import selectService from "@salesforce/label/c.BSDT_Select_Service";
import selectContacts from "@salesforce/label/c.BSDT_Select_Contacts";
import review from "@salesforce/label/c.BSDT_Review";

export default class GroupServiceDeliveries extends LightningElement {
    _steps;
    currentStep = {};
    isOptionSelection = true;
    serviceDelivery;

    labels = {
        groupTitle,
        groupDesc,
        groupButton,
        singleTitle,
        singleDesc,
        singleButton,
        selectService,
        selectContacts,
        review,
    };

    get steps() {
        return this._steps ? this._steps.all : undefined;
    }

    get isStep1() {
        return this.currentStep && this.currentStep.value === 0;
    }

    get isStep2() {
        return this.currentStep && this.currentStep.value === 1;
    }

    handleOption1() {
        this.createSteps();
        this.currentStep = this._steps.currentStep;
        this.isOptionSelection = false;
    }

    handleOption2() {
        this.dispatchEvent(new CustomEvent("hide"));
    }

    handleNext() {
        if (this.isStep1) {
            this.getServiceDelivery();
        }

        if (this.isStep2) {
            this.dispatchEvent(new CustomEvent("hide"));
            return;
        }

        this._steps.next();
        this.currentStep = this._steps.currentStep;
    }

    handleBack() {
        this._steps.back();
        this.currentStep = this._steps.currentStep;
    }

    createSteps() {
        this._steps = new ProgressSteps();
        this._steps
            .addStep("", this.labels.selectService, new NavigationItems().addNext())
            .addStep(
                "",
                this.labels.selectContacts,
                new NavigationItems().addNext().addBack()
            )
            .addStep("", this.labels.review);
    }

    getServiceDelivery() {
        let serviceDelivery = this.template.querySelector("c-group-service-delivery");

        if (!serviceDelivery) {
            return;
        }

        this.serviceDelivery = serviceDelivery.getFields();
        console.log(JSON.stringify(this.serviceDelivery));
    }
}
