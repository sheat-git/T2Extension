document.addEventListener('load', autoLogin(), false);


function autoLogin() {
    switch (document.title) {
        case '東工大ポータル':
        case 'Tokyo Tech Portal':
            const agreeButton = document.getElementsByTagName('input')[1];
            agreeButton.click();
            break;
        case 'Entrust GetAccess':
            const login = document.getElementsByName('OK')[0];
            if (document.getElementsByTagName('td')[1].textContent.includes('account')) {
                const account = document.getElementsByName('usr_name')[0];
                const password = document.getElementsByName('usr_password')[0];
                dotsFontLoad()
                .then(disableAutocomplete(password))
                .then(() => {
                    Promise.all([getUD1('Account', account), getUD1('Password', password)]).then(() => {
                        login.click();
                    }).catch(() => {;});
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
                    return Promise.all([getUD2(rawLocations.item(index[0]), element1), getUD2(rawLocations.item(index[1]), element2), getUD2(rawLocations.item(index[2]), element3)]).then(() => {
                        login.click();
                    }).catch(() => {;});
                }
            }
            break;
    }
}

function getUD1(key, element) {
    return new Promise((resolve, reject) => {
        browser.runtime.sendMessage(["getUD", key]).then((response) => {
            if (response == undefined) {
                reject();
            } else if (response == "") {
                reject();
            } else {
                element.value = response;
                resolve();
            }
        });
    });
}

function getUD2(locationElement, inputElement) {
    return new Promise((resolve, reject) => {
        browser.runtime.sendMessage(["getUD", `Row${locationElement.textContent.match(/[0-9]/g)[0]}`]).then((response) => {
            if (response == undefined) {
                reject();
            } else if (response == "") {
                reject();
            } else {
                inputElement.value = response.charAt(locationElement.textContent.match(/[A-Z]/g)[0].charCodeAt(0) - 65);
                resolve();
            }
        });
    });
}

function dotsFontLoad() {
    const dotFont = new FontFace('Dots', `url(https://github.com/sheat-git/fonts/blob/main/Password%20Dots/Password%20Dots.ttf?raw=true)`, { style: 'normal', weight: 700});
    return new Promise((resolve, reject) => {
        dotFont.load().then((loadedFace) => {
            document.fonts.add(loadedFace);
            resolve();
        });
    });
}

function disableAutocomplete(element) {
    return new Promise((resolve, reject) => {
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
