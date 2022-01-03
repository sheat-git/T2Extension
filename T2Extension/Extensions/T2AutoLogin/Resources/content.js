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
                Promise.all([promiseGetUD1('Account', account), promiseGetUD1('Password', password)]).then(() => {
                    login.click();
                }).catch(() => {
                    ;
                });
            } else {
                const element1 = document.getElementsByName('message3')[0];
                const element2 = document.getElementsByName('message4')[0];
                const element3 = document.getElementsByName('message5')[0];
                if (navigator.platform == 'iPhone' || navigator.platform == 'iPad') {
                    promise(document.getElementsByTagName('td'), [4, 5, 6]);
                } else {
                    promise(document.getElementsByTagName('th'), [4, 6, 8]);
                }
                function promise(rawLocations, index) {
                    Promise.all([promiseGetUD2(rawLocations.item(index[0]), element1), promiseGetUD2(rawLocations.item(index[1]), element2), promiseGetUD2(rawLocations.item(index[2]), element3)]).then(() => {
                        login.click();
                    }).catch(() => {
                        ;
                    });
                }
            }
            break;
    }
}

function promiseGetUD1(key, element) {
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
        })
    })
}

function promiseGetUD2(locationElement, inputElement) {
    const content = locationElement.textContent
    return new Promise((resolve, reject) => {
        const rowNum = content.match(/[0-9]/g)[0];
        browser.runtime.sendMessage(["getUD", `Row${rowNum}`]).then((response) => {
            if (response == undefined) {
                reject();
            } else if (response == "") {
                reject();
            } else {
                inputElement.value = response.charAt(content.match(/[A-Z]/g)[0].charCodeAt(0) - 65);
                resolve();
            }
        })
    })
}

document.addEventListener('load', autoLogin(), false);
