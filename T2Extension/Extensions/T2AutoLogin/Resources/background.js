browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
    browser.runtime.sendNativeMessage('application.id', { message: request }, response => {
        sendResponse(response);
    });
    return true;
});
