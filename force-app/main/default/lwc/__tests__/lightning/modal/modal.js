import { LightningElement, api } from "lwc";

export default class Modal extends LightningElement {
    @api content;
    @api open() {}
    @api close() {}
}
