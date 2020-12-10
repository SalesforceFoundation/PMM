import { api, LightningElement, track, wire } from "lwc";
import { getListUi } from "lightning/uiListApi";
import LIST_VIEW_LABEL from "@salesforce/label/c.List_Views";

export default class ListViewSelector extends LightningElement {
    @api objectApiName;
    @api records;
    @track selectedListView = {};

    error;
    _options = [];

    labels = {
        listViews: LIST_VIEW_LABEL,
    };

    @wire(getListUi, { objectApiName: "$objectApiName" })
    wiredListViews;

    @wire(getListUi, {
        objectApiName: "$objectApiName",
        listViewApiName: "$selectedListView.value",
    })
    listView({ error, data }) {
        if (data) {
            this.records = data.records ? data.records.records : undefined;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.records = undefined;
        }
    }

    get options() {
        if (
            this._options.length > 0 ||
            !this.wiredListViews ||
            !this.wiredListViews.data
        ) {
            return this._options;
        }

        this._options = this.wiredListViews.data.lists.map(listView => {
            return {
                label: listView.label,
                value: listView.apiName,
                isChecked: listView.apiName === this.selectedListView.value,
            };
        });
        if (!this._options.length) {
            return this._options;
        }
        this._options[0].isChecked = true;
        this.selectedListView = { ...this._options[0] };
        return this._options;
    }

    handleListViewSelected(event) {
        this._options.forEach(option => {
            option.isChecked = option.value === event.detail.value;
        });
        this.selectedListView = this._options.find(option => option.isChecked);
        this.dispatchEvent(new CustomEvent("select", { detail: this.selectedListView }));
    }
}
