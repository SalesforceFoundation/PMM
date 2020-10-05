import { ProgressStep } from "./progressStep";

export class ProgressSteps {
    constructor() {
        this._steps = [];
        this._currentValue = 0;
    }

    get all() {
        return this._steps;
    }

    set currentValue(value) {
        this._currentValue = value;
    }

    get currentStep() {
        if (this._steps && this._steps.length > this._currentValue) {
            return this._steps[this._currentValue];
        }

        return undefined;
    }

    get hasNext() {
        return this._currentValue < this._steps.length - 1;
    }

    addStep(instructions, label, navigationItems) {
        this._steps.push(
            new ProgressStep(this._steps.length, instructions, label, navigationItems)
        );
        return this;
    }

    next() {
        this._currentValue += this.hasNext ? 1 : 0;
    }

    back() {
        this._currentValue -= this._currentValue > 0 ? 1 : 0;
    }

    restart() {
        this._currentValue = 0;
    }
}
