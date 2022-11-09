const { jestConfig } = require("@salesforce/sfdx-lwc-jest/config");
module.exports = {
    ...jestConfig,
    moduleNameMapper: {
        "^lightning/modalHeader$":
            "<rootDir>/force-app/main/default/lwc/__tests__/lightning/modalHeader/modalHeader",
        "^lightning/modalBody$":
            "<rootDir>/force-app/main/default/lwc/__tests__/lightning/modalBody/modalBody",
        "^lightning/modalFooter$":
            "<rootDir>/force-app/main/default/lwc/__tests__/lightning/modalFooter/modalFooter",
        "^lightning/modal$":
            "<rootDir>/force-app/main/default/lwc/__tests__/lightning//modal"
    },
    testPathIgnorePatterns: ["force-app/main/default/lwc/__tests__/", ".cci"],
    reporters: ["default", "jest-junit"],
    setupFilesAfterEnv: ["./jest.setup.js"]
};
