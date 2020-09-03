import NEXT_LABEL from "@salesforce/label/c.Next";
import BACK_LABEL from "@salesforce/label/c.Back";
import FINISH_LABEL from "@salesforce/label/c.Finish";

const names = {
    NEXT: "next",
    FINISH: "finish",
    BACK: "back",
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

    addBack(label = BACK_LABEL, variant) {
        return this._addNavigationItem(names.BACK, label, variant);
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

    get back() {
        return this._navigationItems.back;
    }

    get finish() {
        return this._navigationItems.finish;
    }
}
