const { jestConfig } = require("@salesforce/sfdx-lwc-jest/config");
module.exports = {
    ...jestConfig,
    testPathIgnorePatterns: ["force-app/main/default/lwc/__tests__/", ".cci"],
    reporters: ["default", "jest-junit"],
    setupFilesAfterEnv: ["./jest.setup.js"]
};
