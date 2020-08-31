import NEXT_LABEL from "@salesforce/label/c.Next";
import PREVIOUS_LABEL from "@salesforce/label/c.Previous";
import FINISH_LABEL from "@salesforce/label/c.Finish";

const names = {
    NEXT: "next",
    FINISH: "finish",
    PREVIOUS: "previous",
};

const BRAND = "brand";

export class NavigationItems {
    navigationItem;

    constructor() {
        this._navigationItems = {};
    }

    addNext(label = NEXT_LABEL, variant = BRAND) {
        return this._addNavigationItem(names.NEXT, label, variant);
    }

    addPrevious(label = PREVIOUS_LABEL, variant) {
        return this._addNavigationItem(names.PREVIOUS, label, variant);
    }

    addFinish(label = FINISH_LABEL, variant = BRAND) {
        return this._addNavigationItem(names.FINISH, label, variant);
    }

    _addNavigationItem(name, label, variant) {
        this._navigationItems[name] = { label: label, variant: variant };
        return this;
    }

    get next() {
        return this._navigationItems.next;
    }

    get previous() {
        return this._navigationItems.previous;
    }

    get finish() {
        return this._navigationItems.finish;
    }
}
