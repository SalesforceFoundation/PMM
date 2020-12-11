import { api, LightningElement, track, wire } from "lwc";
import { getListUi } from "lightning/uiListApi";
import userId from "@salesforce/user/Id";
import LIST_VIEW_LABEL from "@salesforce/label/c.List_Views";
import PIN_LIST_VIEW_LABEL from "@salesforce/label/c.Pin_List_View";

const PINNED_LIST_VIEW = "PinnedListView";

export default class ListViewSelector extends LightningElement {
    @api objectApiName;
    @track selectedListView = {};

    records;
    pageToken = null;
    nextPageToken = null;
    perviousPageToken = null;
    error;
    pinnedListViewKey = `${PINNED_LIST_VIEW}_${userId}`;
    _options = [];

    labels = {
        listViews: LIST_VIEW_LABEL,
        pinListView: PIN_LIST_VIEW_LABEL,
    };

    @wire(getListUi, { objectApiName: "$objectApiName" })
    wiredListViews;

    @wire(getListUi, {
        objectApiName: "$objectApiName",
        listViewApiName: "$selectedListView.value",
        pageSize: 2000,
        pageToken: "$pageToken",
    })
    listView({ error, data }) {
        if (data && data.records) {
            this.records = data.records.records;
            this.error = undefined;
            this.nextPageToken = data.records.nextPageToken;
            this.previousPageToken = data.records.previousPageToken;
            this.dispatchEvent(new CustomEvent("select", { detail: this.records }));
        } else if (error) {
            this.error = error;
            this.records = undefined;
        }
    }

    handleNextPage() {
        this.pageToken = this.nextPageToken;
    }

    handlePreviousPage() {
        this.pageToken = this.previousPageToken;
    }

    get options() {
        if (
            this._options.length > 0 ||
            !this.wiredListViews ||
            !this.wiredListViews.data
        ) {
            return this._options;
        }

        if (
            !this.selectedListView.value &&
            localStorage.getItem(this.pinnedListViewKey)
        ) {
            this.selectedListView = JSON.parse(
                localStorage.getItem(this.pinnedListViewKey)
            );
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

        if (!this.selectedListView.value) {
            this._options[0].isChecked = true;
            this.selectedListView = { ...this._options[0] };
        }

        return this._options;
    }

    handlePinListView() {
        localStorage.setItem(
            this.pinnedListViewKey,
            JSON.stringify(this.selectedListView)
        );
    }

    handleListViewSelected(event) {
        this._options.forEach(option => {
            option.isChecked = option.value === event.detail.value;
        });
        this.selectedListView = this._options.find(option => option.isChecked);
    }
}
