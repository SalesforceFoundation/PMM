//https://github.com/salesforce/sa11y/tree/master/packages/jest

const { registerSa11yMatcher } = require("@sa11y/jest");
registerSa11yMatcher();

global.flushPromises = () => new Promise(resolve => setImmediate(resolve));

// assert that DOM is accessible (using extended preset-rule)
global.isAccessible = async element => {
    await expect(element).toBeAccessible();
};

global.clearDOM = () => {
    while (document.body.firstChild) {
        document.body.removeChild(document.body.firstChild);
    }
    jest.clearAllMocks();
};
