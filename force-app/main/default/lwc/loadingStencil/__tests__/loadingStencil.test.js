import { createElement } from "lwc";
import LoadingStencil from "c/loadingStencil";

describe("c-loading-stencil", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-loading-stencil", {
            is: LoadingStencil,
        });
    });

    it("displays the stencils with default levels", async () => {
        document.body.appendChild(element);

        let stencils = element.shadowRoot.querySelectorAll(".stencil");
        expect(stencils.length).toBe(element.levels.length);
        expect(element.levels.length).toBeGreaterThan(0);
        global.isAccessible(element);
    });

    it("displays the stencils with provided levels", () => {
        element.levels = [1, 0.5, 0.25];
        document.body.appendChild(element);

        let stencils = element.shadowRoot.querySelectorAll(".stencil");
        expect(stencils.length).toBe(3);
    });

    it("displays nothing without levels", () => {
        element.levels = [];
        document.body.appendChild(element);

        let stencils = element.shadowRoot.querySelectorAll(".stencil");
        expect(stencils.length).toBe(0);
    });

    it("displays a spinner", () => {
        element.levels = [1, 0.5, 0.25];
        document.body.appendChild(element);

        let spinner = element.shadowRoot.querySelector("lightning-spinner");
        expect(spinner).toBeDefined();
    });
});
