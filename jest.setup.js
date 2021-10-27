//https://github.com/salesforce/sa11y/tree/master/packages/jest

const { registerSa11yMatcher } = require("@sa11y/jest");
registerSa11yMatcher();

global.flushPromises = () => new Promise(resolve => setImmediate(resolve));

global.isAccessible = async element => {
    try {
        await expect(element).toBeAccessible();
    } catch (e) {
        console.log(JSON.stringify(e.message));
    }
};

global.clearDOM = () => {
    while (document.body.firstChild) {
        document.body.removeChild(document.body.firstChild);
    }
    jest.clearAllMocks();
};
