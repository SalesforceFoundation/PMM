import { LightningElement, api } from "lwc";

export default class AttendanceRow extends LightningElement {
    @api unitOfMeasurement;
    @api contactId;
    @api presentStatus;
    @api record;
    @api fieldSet;
}
