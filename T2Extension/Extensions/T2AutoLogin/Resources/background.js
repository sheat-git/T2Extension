browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
    switch(request[0]) {
        case "getUD":
            browser.runtime.sendNativeMessage('application.id', { message: request }, response => {
                sendResponse(response);
            });
            return true;
            break;
        case "openURL":
            browser.tabs.create({
                url: request[1]
            });
            break;
    }
});
