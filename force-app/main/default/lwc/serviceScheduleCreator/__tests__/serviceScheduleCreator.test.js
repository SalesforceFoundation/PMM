import { createElement } from "lwc";
import ServiceScheduleCreator from "c/serviceScheduleCreator";

describe("c-service-schedule-creator", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-service-schedule-creator", {
            is: ServiceScheduleCreator,
        });
    });

    it("modal is displayed and is accessible", () => {
        document.body.appendChild(element);

        return global.flushPromises().then(async () => {
            //verify that the header is displayed
            const modal = element.shadowRoot.querySelector("c-modal");
            expect(modal.header).not.toBe(null);

            await expect(element).toBeAccessible();
        });
    });
});
