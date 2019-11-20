({
    debug: function(valuesByName, title) {
        let debugs = [];
        if (title) {
            debugs.push("======  " + title + "  =====");
        }
        for (let name in valuesByName) {
            if (valuesByName.hasOwnProperty(name)) {
                debugs.push(
                    name + ": " + JSON.stringify(valuesByName[name], null, 2)
                );
            }
        }

        // eslint-disable-next-line no-console
        console.log(debugs.join("\n"));
    }
});
