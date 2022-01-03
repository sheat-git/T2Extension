function openURL(url) {
    browser.runtime.sendMessage(["openURL", url]);
}

function openT2E() {
    openURL("T2Extension-app://")
}

function openTTP() {
    openURL("https://portal.titech.ac.jp/");
}

function openT2S() {
    openURL("https://t2schola.titech.ac.jp/")
}

function specifyOS() {
    var ua = window.navigator.userAgent.toLowerCase();
    if (ua.indexOf('iphone') > -1) {
        document.body.classList.add('iPhone');
    } else if (ua.indexOf('ipad') > -1 || (ua.indexOf('macintosh') > -1 && 'ontouchend' in document)) {
        document.body.classList.add('iPad');
    }else{
        document.body.classList.add('mac');
    }
}

function addClickFunction() {
    document.getElementById('openT2E').addEventListener('click', openT2E);
    document.getElementById('openTTP').addEventListener('click', openTTP);
    document.getElementById('openT2S').addEventListener('click', openT2S);
}

document.addEventListener('DOMContentLoaded', function() {
    specifyOS();
    addClickFunction();
});
