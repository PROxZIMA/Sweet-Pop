// ==UserScript==
// @name           Floating Toolbox
// @version        0.0.1
// @author         PROxZIMA
// @homepage       https://github.com/PROxZIMA
// @note           specifically designed for https://github.com/PROxZIMA/Sweet-Pop
// @note           fx-autoconfig https://github.com/MrOtherGuy/fx-autoconfig
// @description    Enable/disable floating Toolbox using `about:config`:`userChromeJS.floatingToolbox.enabled` or from `Toolbox Menu > Tools > userscripts > Floating Toolbox`
// ==/UserScript==

(function () {
    // var prefs = Services.prefs,
    //     enabled;
    // if (prefs.prefHasUserValue('userChromeJS.floatingToolbox.enabled')) {
    //     enabled = prefs.getBoolPref('userChromeJS.floatingToolbox.enabled')
    // } else {
    //     prefs.setBoolPref('userChromeJS.floatingToolbox.enabled', false);
    //     enabled = false;
    // }

    var css = `
    #main-window:not([customizing="true"]) #navigator-toolbox {
        display: grid;
        position: fixed !important;
        transition: transform 85ms linear, opacity 85ms linear !important;
        transform-origin: top;
        transform: rotateX(75deg);
        opacity: 0;
    }
    `;

    var sss = Cc['@mozilla.org/content/style-sheet-service;1'].getService(Ci.nsIStyleSheetService);
    var uri = makeURI('data:text/css;charset=UTF=8,' + encodeURIComponent(css));

    // if (enabled) {
        sss.loadAndRegisterSheet(uri, sss.AGENT_SHEET);
    // }
})();
