import { LightningElement, api } from "lwc";

export default class EmptyState extends LightningElement {
    @api text;
    @api subText;
    @api altText;
}
