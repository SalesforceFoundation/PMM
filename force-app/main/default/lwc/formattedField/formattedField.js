import { LightningElement, api } from "lwc";
import TIME_ZONE from "@salesforce/i18n/timeZone";

const NUMBER_TYPES = ["DOUBLE", "INTEGER", "LONG", "CURRENCY"];
const DATE_TIME = "DATETIME";
const DATE = "DATE";
const TIME = "TIME";

export default class FormattedField extends LightningElement {
    @api field;
    @api record;

    timeZone = TIME_ZONE;

    get apiName() {
        return this.field.apiName;
    }

    get label() {
        return this.field.label;
    }

    get type() {
        return this.field.type;
    }

    get isDateTime() {
        return this.type === DATE_TIME;
    }

    get isDate() {
        return this.type === DATE;
    }

    get isNumber() {
        return NUMBER_TYPES.includes(this.type);
    }

    get isTime() {
        return this.type === TIME;
    }

    get isText() {
        return !(this.isDateTime || this.isNumber || this.isDate || this.isTime);
    }

    get value() {
        if (!this.record) {
            return undefined;
        }
        let val;

        if (this.path && this.path.includes(".")) {
            let referenceField = this.path.split(".")[0];

            val =
                this.record[referenceField] !== undefined
                    ? this.record[referenceField][this.apiName]
                    : undefined;
        } else {
            val = this.record[this.apiName];
        }

        if (this.isTime) {
            let ms = val % 1000;
            val = (val - ms) / 1000;
            let secs = val % 60;
            val = (val - secs) / 60;
            let mins = val % 60;
            let hrs = (val - mins) / 60;
            hrs = hrs < 10 ? "0" + hrs : hrs;
            mins = mins < 10 ? "0" + mins : mins;
            val = hrs + ":" + mins + ":00.000Z";
        }

        return val;
    }

    get path() {
        return this.field.path;
    }
}
