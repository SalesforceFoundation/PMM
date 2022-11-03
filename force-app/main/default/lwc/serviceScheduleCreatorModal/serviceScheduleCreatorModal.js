import { api } from "lwc";
import LightningModal from "lightning/modal";
import newServiceSchedule from "@salesforce/label/c.New_Service_Schedule";

export default class ServiceScheduleCreatorModal extends LightningModal {
    labels = {
        newServiceSchedule,
    };
    // Data is passed to api properties via .open({ options: [] })
    @api content;
    serviceId;
    recordTypeId;
    isCommunity = false;
    handleOkay() {
        this.close("okay");
    }
    handleClose() {
        this.close("okay");
    }
}
