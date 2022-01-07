document.addEventListener('load', autoLogin(), false);


function autoLogin() {
    switch (document.title) {
        case '東工大ポータル':
        case 'Tokyo Tech Portal':
            const agreeButton = document.getElementsByTagName('input')[1];
            browser.runtime.sendMessage(['getDate']).then((lastLogin) => {
                console.log(lastLogin);
                const now = new Date();
                let nextLogin = new Date(lastLogin);
                nextLogin.setSeconds(nextLogin.getSeconds() + 5);
                browser.runtime.sendMessage(['setDate']);
                if (now < lastLogin || nextLogin < now) {
                    agreeButton.click();
                }
            });
            break;
        case 'Entrust GetAccess':
            browser.runtime.sendMessage(['setDate']);
            const login = document.getElementsByName('OK')[0];
            if (document.getElementsByTagName('td')[1].textContent.includes('account')) {
                const account = document.getElementsByName('usr_name')[0];
                const password = document.getElementsByName('usr_password')[0];
                dotsFontLoad()
                .then(disableAutocomplete(password))
                .then(() => {
                    Promise.allSettled([getUD1andSet('Account', account), getUD1andSet('Password', password)]).then(() => {
                        //login.click();
                    }).catch((error) => {
                        console.log(error);
                        Promise.all([getUD1andSet('Account', account), getUD1andSet('Password', password)]).then(() => {
                            //login.click();
                        });
                    });
                })
                .catch(() => {;});
            } else {
                const element1 = document.getElementsByName('message3')[0];
                const element2 = document.getElementsByName('message4')[0];
                const element3 = document.getElementsByName('message5')[0];
                const elements = [element1, element2, element3];
                dotsFontLoad()
                .then(disableAutocompletes(elements))
                .then(() => {
                    if (navigator.platform == 'iPhone' || navigator.platform == 'iPad') {
                        matrix(document.getElementsByTagName('td'), [4, 5, 6]);
                    } else {
                        matrix(document.getElementsByTagName('th'), [4, 6, 8]);
                    }
                })
                .catch(() => {;});
                function matrix(rawLocations, index) {
                    return Promise.allSettled([getUD2andSet(rawLocations.item(index[0]), element1), getUD2andSet(rawLocations.item(index[1]), element2), getUD2andSet(rawLocations.item(index[2]), element3)]).then(() => {
                        login.click();
                    }).catch((error) => {
                        console.log(error);
                        Promise.all([getUD2andSet(rawLocations.item(index[0]), element1), getUD2andSet(rawLocations.item(index[1]), element2), getUD2andSet(rawLocations.item(index[2]), element3)]).then(() => {
                            login.click();
                        });
                    });
                }
            }
            break;
    }
}

function getUD1andSet(key, element) {
    return new Promise((resolve, reject) => {
        window.setTimeout(reject, 500, 'runtimeError');
        browser.runtime.sendMessage(['getUD', key]).then((response) => {
            if (response == undefined) {
                reject('responseError');
            } else if (response == '') {
                reject('responseError');
            } else {
                element.value = response;
                resolve();
            }
        });
    });
}

function getUD2andSet(locationElement, inputElement) {
    return new Promise((resolve, reject) => {
        window.setTimeout(reject, 500, 'runtimeError');
        browser.runtime.sendMessage(['getUD', `Row${locationElement.textContent.match(/[0-9]/g)[0]}`]).then((response) => {
            if (response == undefined) {
                reject('responseError');
            } else if (response == '') {
                reject('responseError');
            } else {
                inputElement.value = response.charAt(locationElement.textContent.match(/[A-Z]/g)[0].charCodeAt(0) - 65);
                resolve();
            }
        });
    });
}

function disableAutocomplete(element) {
    return new Promise((resolve, reject) => {
        element.style.width = element.offsetWidth;
        element.style.height = element.offsetHeight;
        element.style.margin = "2px";
        element.style.fontFamily = '"Dots"';
        element.removeAttribute('placeholder');
        element.removeAttribute('ng-model');
        element.setAttribute('type', 'text');
        resolve();
    });
}

function disableAutocompletes(elements) {
    return Promise.all(elements.map(e => disableAutocomplete(e)));
}

function dotsFontLoad() {
    const dotFont = new FontFace('Dots', 'url("data:application/font-woff; charset=utf-8; base64,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") format("woff")', { style: 'normal', weight: 500});
    return new Promise((resolve, reject) => {
        dotFont.load().then((loadedFace) => {
            document.fonts.add(loadedFace);
            resolve();
        });
    });
}
