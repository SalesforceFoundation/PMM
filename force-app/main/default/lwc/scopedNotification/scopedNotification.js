import { LightningElement, api } from "lwc";
import ERROR_LABEL from "@salesforce/label/c.Error";
import SUCCESS_LABEL from "@salesforce/label/c.Success";

const INFO = "info";
const SUCCESS = "success";
const ERROR = "error";
const THEMES = [SUCCESS, INFO, "warning", ERROR];
const INVERSE_ICON_THEMES = [SUCCESS, INFO, ERROR];

export default class ScopedNotification extends LightningElement {
    @api theme = "light";
    @api title;

    labels = {
        error: ERROR_LABEL,
        success: SUCCESS_LABEL,
    };

    get slds() {
        let slds = "slds-scoped-notification slds-media slds-media_center ";
        if (this.theme === "light") {
            slds += "slds-scoped-notification_light";
        } else {
            const theme = !THEMES.includes(this.theme) ? INFO : this.theme;
            slds += `slds-theme_${theme}`;
        }

        return slds;
    }

    get iconName() {
        let iconName = `utility:${this.icon}`;

        return iconName;
    }

    get iconVariant() {
        if (INVERSE_ICON_THEMES.includes(this.theme)) {
            return "inverse";
        }

        return undefined;
    }

    get icon() {
        if (!THEMES.includes(this.theme)) {
            return INFO;
        }
        return this.theme;
    }

    get alternativeText() {
        if (!this.theme || !THEMES.includes(this.theme)) {
            return this.labels.info;
        }
        return this.labels[this.theme];
    }
}
