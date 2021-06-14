import { LightningElement, api } from "lwc";
import loading from "@salesforce/label/c.Loading";

const OPACITY = "opacity:";

export default class LoadingStencil extends LightningElement {
    @api levels = [1, 0.95, 0.9, 0.85, 0.8, 0.75, 0.7, 0.65, 0.6, 0.55, 0.5];
    labels = {
        loading,
    };

    renderedCallback() {
        this.setOpacity();
    }

    setOpacity() {
        let elements = this.template.querySelectorAll(".opacity-target");

        this.levels.forEach((level, index) => {
            elements[index].style = `${OPACITY} ${level}`;
        });
    }
}
