import { LightningElement, api } from "lwc";
import newServiceSchedule from "@salesforce/label/c.New_Service_Schedule";

export default class ServiceScheduleCreatorWrapper extends LightningElement {
    @api recordTypeId;
    @api isCommunity;
    @api serviceId;

    labels = { newServiceSchedule };

    handleClose() {
        this.template.querySelector("c-service-schedule-creator").handleClose();
    }
}
