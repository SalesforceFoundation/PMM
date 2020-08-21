export class ProgressStep {
    constructor(value, instructions, label, navigationItems) {
        this.label = label;
        this.instructions = instructions;
        this._navigationItems = navigationItems;
        this.value = value;
    }

    get next() {
        return this._navigationItems && this._navigationItems.next
            ? this._navigationItems.next
            : undefined;
    }

    get previous() {
        return this._navigationItems && this._navigationItems.previous
            ? this._navigationItems.previous
            : undefined;
    }

    get finish() {
        return this._navigationItems && this._navigationItems.finish
            ? this._navigationItems.finish
            : undefined;
    }
}
