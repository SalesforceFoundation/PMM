import { LightningElement, track, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import { format, isNull } from "c/util";

// User/Schema
import USER_ID from "@salesforce/user/Id";
import USER_FIRST_NAME_FIELD from "@salesforce/schema/User.FirstName";
import USER_PHOTO_URL_FIELD from "@salesforce/schema/User.FullPhotoUrl";

// Labels
import GOOD_MORNING from "@salesforce/label/c.GoodMorningFirstName";
import GOOD_AFTERNOON from "@salesforce/label/c.GoodAfternoonFirstName";
import GOOD_EVENING from "@salesforce/label/c.GoodEveningFirstName";

export default class HomeHeader extends LightningElement {
    @track user;
    @track welcomeMessage;
    @track error;

    /**
     * getRecord must be called with @wire and cannot be called imperatively.
     * Gets current User's FirstName and FullPhotoUrl.
     */
    @wire(getRecord, {
        recordId: USER_ID,
        mode: "View",
        fields: [USER_FIRST_NAME_FIELD, USER_PHOTO_URL_FIELD],
    })
    wireUser({ data, error }) {
        if (error) {
            this.error = error;
        } else if (data) {
            this.user = {
                photoUrl: getFieldValue(data, USER_PHOTO_URL_FIELD),
                firstName: getFieldValue(data, USER_FIRST_NAME_FIELD),
            };

            if (
                isNull(this.user.photoUrl) ||
                this.user.photoUrl.endsWith("profilephoto/005/F")
            ) {
                // The default photo is used; use Astro instead.
                this.user.photoUrl =
                    "/_slds/images/themes/lightning_blue/lightning_blue_profile_avatar_160.png";
            }

            this.setWelcomeMessage("wireUser");
        }
    }

    /**
     * Sets welcomeMessage if @wire callback successfully complete:
     * - wireUser
     * Both getListUi, getRecord cannot be called imperatively meaning we must use @wire
     */
    setWelcomeMessage() {
        if (!isNull(this.user)) {
            // The getRecord @wires successfully completed their callbacks.
            this.welcomeMessage = format(this.greetingFormat, {
                firstName: this.user.firstName,
            });
        }
    }

    get greetingFormat() {
        const hours = new Date().getHours();
        if (hours < 12) {
            return GOOD_MORNING;
        } else if (hours < 18) {
            return GOOD_AFTERNOON;
        }
        return GOOD_EVENING;
    }

    get today() {
        return new Date();
    }
}
