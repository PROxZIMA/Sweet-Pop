// ==UserScript==
// @name           Floating Scrollbar
// @namespace      scrollbars_win10
// @version        0.0.8
// @note           Windows 10 style by /u/mrkwatz https://www.reddit.com/r/FirefoxCSS/comments/7fkha6/firefox_77_windows_10_uwp_style_overlay_scrollbars/
// @note           Brought to Firefox 77 by /u/Wiidesire https://www.reddit.com/r/firefox/comments/7f6kc4/floating_scrollbar_finally_possible_in_firefox_77/
// @note           fx-autoconfig https://github.com/MrOtherGuy/fx-autoconfig
// @note           Forked from https://github.com/Endor8/userChrome.js/blob/master/floatingscrollbar/FloatingScrollbar.uc.js
// ==/UserScript==

(function () {
    // var prefs = Services.prefs,
    //     enabled;
    // if (prefs.prefHasUserValue('userChromeJS.floatingScrollbar.enabled')) {
    //     enabled = prefs.getBoolPref('userChromeJS.floatingScrollbar.enabled')
    // } else {
    //     prefs.setBoolPref('userChromeJS.floatingScrollbar.enabled', true);
    //     enabled = true;
    // }

    var css = `
    link[href$="global.css"] ~ scrollbox {
        overflow-y: auto !important;
    }
    link[href$="global.css"] ~ .menupopup-scrollbutton {
        display: none !important;
    }
    link[href$="global.css"] ~ hbox > arrowscrollbox.in-bookmarks-menu {
        padding-bottom: 0px !important;
    }
    link[href$="global.css"] ~ scrollbox {
        padding-top: 0px !important;
    }
    link[href$="global.css"] ~ .scrollbutton-up,
    link[href$="global.css"] ~ .scrollbutton-down,
    link[href$="global.css"] ~ spacer[part=arrowscrollbox-overflow-start-indicator],
    link[href$="global.css"] ~ spacer[part=arrowscrollbox-overflow-end-indicator] {
        display: none !important;
    }
    .hidevscroll-scrollbar {
        -moz-appearance: none!important;
        margin-left: 7px!important;
        border: none!important;
        position: relative!important;
        background-color: transparent!important;
        padding: 0px!important;
        z-index: 2147483647!important;
    }
    .hidevscroll-scrollbar[orient = "vertical"] {
        -moz-margin-start: -7px!important;
        min-width: 7px!important;
    }
    .hidevscroll-scrollbar[orient = "vertical"] thumb {
        min-height: 20px!important;
    }
    .hidevscroll-scrollbar thumb {
        -moz-appearance: none!important;
        border-width: 0px!important;
        border-radius: 7px!important;
        background-color: rgb(136, 137, 141, 1)!important;
        opacity: 0!important;
        transition: opacity 0.4s ease-in-out!important;
        -webkit-transform-style: preserve-3d!important;
        -webkit-backface-visibility: hidden!important;
    }
    .hidevscroll-scrollbar:hover thumb {
        background-color: rgb(136, 137, 141, 1)!important;
        opacity: 0.7!important;
        transition: opacity 0.1s ease-in-out!important;
        -webkit-transform-style: preserve-3d!important;
        -webkit-backface-visibility: hidden!important;
    }
    .hidevscroll-scrollbar[orient = "vertical"] thumb:active {
        background: linear-gradient(to top, #c50ed2, #8500f7) !important;
    }
    .hidevscroll-scrollbar[orient = "horizontal"] thumb:active {
        background: linear-gradient(to left, #c50ed2, #8500f7) !important;
    }
    .hidevscroll-scrollbar thumb:active {
        opacity: 0.9!important;
        transition: opacity 0.06s ease-in-out!important;
        -webkit-transform-style: preserve-3d!important;
        -webkit-backface-visibility: hidden!important;
    }
    .hidevscroll-scrollbar scrollbarbutton, .hidevscroll-scrollbar gripper {
        display: none!important;
    }
    :not(select):not(hbox) > scrollbar {
        -moz-appearance: none!important;
        position: relative;
        background-color: transparent;
        background-image: none;
        z-index: 2147483647;
        padding: 0px;
    }
    :not(select):not(hbox) > scrollbar[orient = "vertical"] {
        -moz-margin-start: -7px;
        min-width: 7px;
        max-width: 7px;
    }
    :not(select):not(hbox) > scrollbar[orient = "vertical"] thumb {
        min-height: 20px;
    }
    :not(select):not(hbox) > scrollbar[orient = "horizontal"] {
        margin-top: -7px;
        min-height: 7px;
        max-height: 7px;
    }
    :not(select):not(hbox) > scrollbar[orient = "horizontal"] thumb {
        min-width: 20px;
    }
    :not(select):not(hbox) > scrollbar thumb {
        -moz-appearance: none!important;
        border-width: 0px!important;
        border-radius: 7px!important;
        background-color: rgb(136, 137, 141, 1)!important;
        opacity: 0!important;
        transition: opacity 0.4s ease-in-out;
        -webkit-transform-style: preserve-3d;
        -webkit-backface-visibility: hidden;
    }
    :not(select):not(hbox) > scrollbar:hover thumb {
        background-color: rgb(136, 137, 141, 1)!important;
        opacity: 0.7!important;
        transition: opacity 0.1s ease-in-out;
        -webkit-transform-style: preserve-3d;
        -webkit-backface-visibility: hidden;
    }
    :not(select):not(hbox) > scrollbar[orient = "vertical"] thumb:active {
        background: linear-gradient(to top, #c50ed2, #8500f7) !important;
    }
    :not(select):not(hbox) > scrollbar[orient = "horizontal"] thumb:active {
        background: linear-gradient(to left, #c50ed2, #8500f7) !important;
    }
    :not(select):not(hbox) > scrollbar thumb:active {
        opacity: 0.9!important;
        transition: opacity 0.06s ease-in-out;
        -webkit-transform-style: preserve-3d;
        -webkit-backface-visibility: hidden;
    }
    :not(select):not(hbox) > scrollbar scrollbarbutton, :not(select):not(hbox) > scrollbar gripper {
        display: none;
    }
    `;
    
    var sss = Cc['@mozilla.org/content/style-sheet-service;1'].getService(Ci.nsIStyleSheetService);
    var uri = makeURI('data:text/css;charset=UTF=8,' + encodeURIComponent(css));

    // if (enabled) {
        sss.loadAndRegisterSheet(uri, sss.AGENT_SHEET);
    // }
})();
