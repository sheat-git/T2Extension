browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
    switch(request[0]) {
        case "getUD":
            const sendNM = browser.runtime.sendNativeMessage('application.id', { message: request });
            sendNM.then((response) => {
                sendResponse(response);
            }, (error) => {
                console.log(error);
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
