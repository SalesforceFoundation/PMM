const { jestConfig } = require("@salesforce/sfdx-lwc-jest/config");
module.exports = {
    ...jestConfig,
    moduleNameMapper: {
        "^lightning/navigation$":
            "<rootDir>/force-app/main/default/lwc/__tests__/lightning/navigation",
        "^lightning/uiRecordApi$":
            "<rootDir>/force-app/main/default/lwc/__tests__/lightning/uiRecordApi"
    },
    testPathIgnorePatterns: ["force-app/main/default/lwc/__tests__/", ".cci"],
    coveragePathIgnorePatterns: ["force-app/main/default/lwc/__tests__/", ".cci"],
    reporters: ["default", "jest-junit"],
    setupFilesAfterEnv: ["./jest.setup.js"]
};
