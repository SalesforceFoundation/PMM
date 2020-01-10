import { LightningElement, api } from "lwc";
export default class ServiceDeliveryRowIcon extends LightningElement {
    @api iconName;
    @api className;
    @api alternativeText;
    @api size;
    @api variant;
    @api helpText;
}