browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
    switch(request[0]) {
        case "setDate":
            window.localStorage.setItem("lastLogin", JSON.stringify(new Date()));
        case "getDate":
            sendResponse(new Date(JSON.parse(window.localStorage.getItem("lastLogin"))));
        case "getAccount":
        case "getPassword":
        case "getRow":
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
