import { api, LightningElement, track, wire } from "lwc";
import { getListUi } from "lightning/uiListApi";
import { loadStyle } from "lightning/platformResourceLoader";

import userId from "@salesforce/user/Id";
import pmmFolder from "@salesforce/resourceUrl/pmm";

import LIST_VIEWS_LABEL from "@salesforce/label/c.List_Views";
import PIN_LIST_VIEW_LABEL from "@salesforce/label/c.Pin_List_View";
import PIN_TITLE_LABEL from "@salesforce/label/c.Pin_Title";

const PINNED_LIST_VIEW = "PinnedListView";

export default class ListViewSelector extends LightningElement {
    @api objectApiName;
    @api label;
    @track selectedListView = {};

    records;
    pageToken = null;
    nextPageToken = null;
    perviousPageToken = null;
    error;
    pinnedListViewKey = `${PINNED_LIST_VIEW}_${userId}`;
    pinnedListView;
    _options = [];

    labels = {
        listViews: LIST_VIEWS_LABEL,
        pinListView: PIN_LIST_VIEW_LABEL,
        pinTitle: PIN_TITLE_LABEL,
    };

    connectedCallback() {
        loadStyle(this, pmmFolder + "/listViewSelectorOverrides.css");
    }

    @wire(getListUi, { objectApiName: "$objectApiName" })
    listViews({ error, data }) {
        if (data) {
            this.selectPinnedList();
            this.options = data;
            this.selectDefaultList();
        } else if (error) {
            console.log(JSON.stringify(error));
        }
    }

    @wire(getListUi, {
        listViewId: "$selectedListViewValue",
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

    get selectedListViewValue() {
        return this.selectedListView.value;
    }

    selectPinnedList() {
        this.pinnedListView = JSON.parse(localStorage.getItem(this.pinnedListViewKey));

        if (!this.selectedListView.value && this.pinnedListView) {
            this.selectedListView = this.pinnedListView;
        }
    }

    selectDefaultList() {
        if (!this.selectedListView.value && this._options.length) {
            this._options[0].isChecked = true;
            this.selectedListView = { ...this._options[0] };
        }
    }

    handleNextPage() {
        this.pageToken = this.nextPageToken;
    }

    handlePreviousPage() {
        this.pageToken = this.previousPageToken;
    }

    set options(data) {
        this._options = data.lists.map(listView => {
            return {
                label: listView.label,
                value: listView.id,
                isChecked: listView.id === this.selectedListView.value,
            };
        });
    }

    get options() {
        return this._options;
    }

    get pinnedState() {
        return (
            this.pinnedListView &&
            this.selectedListView &&
            this.pinnedListView.value === this.selectedListView.value
        );
    }

    handlePinListView() {
        localStorage.setItem(
            this.pinnedListViewKey,
            JSON.stringify(this.selectedListView)
        );
        this.pinnedListView = this.selectedListView;
    }

    handleListViewSelected(event) {
        this._options.forEach(option => {
            option.isChecked = option.value === event.detail.value;
        });
        this.selectedListView = this._options.find(option => option.isChecked);
    }
}
