import { api } from "lwc";
import LightningModal from "lightning/modal";
import { NavigationMixin } from "lightning/navigation";

import newServiceSchedule from "@salesforce/label/c.New_Service_Schedule";

export default class ServiceScheduleCreatorModal extends NavigationMixin(LightningModal) {
    labels = {
        newServiceSchedule,
    };
    @api serviceId;
    @api recordTypeId;
    @api isCommunity = false;

    handleNavigate(event) {
        const recordId = event.detail.recordId;
        const objectApiName = event.detail.objectApiName;
        this.dispatchEvent(
            new CustomEvent("navigate", {
                detail: {
                    recordId,
                    objectApiName,
                },
            })
        );
        this.close("success");
    }
}
