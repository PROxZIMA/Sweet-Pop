(function () {    
var css = `
		@namespace url(http: //www.mozilla.org/keymaster/gatekeeper/there.is.only.xul);
		:not(select):not(hbox) > scrollbar {
			-moz-appearance: none!important;
			position: relative!important;
			box-sizing: border-box!important;
			background-color: transparent;
			background-image: none;
			z-index: 2147483647;
			padding: 0px;
			display: flex!important;
			justify-content: flex-end;
			pointer-events: auto;
			width: auto!important}
		:not(select):not(hbox) > scrollbar thumb {
			-moz-appearance: none!important;
			border-radius: 8px!important;
			background-color: rgba(100, 100, 100, 0);
			pointer-events: auto}
		:not(select):not(hbox) > scrollbar[orient = "vertical"] {
			width: 8px!important;
			-moz-margin-start: -8px;/*margin to fill the whole render window with content and overlay the scrollbars*/}
		:not(select):not(hbox) > scrollbar[orient = "horizontal"] {
			height: 8px!important;
			margin-top: -8px}
		:not(select):not(hbox) > scrollbar[orient = "vertical"] thumb {
			border-left: 3px solid rgba(80, 80, 80, 0.75);
			min-height: 8px;
			transform: translate(11px, 0px);
			transition: transform 0.1s linear}
		:not(select):not(hbox) > scrollbar[orient = "horizontal"] thumb {
			border-top: 3px solid rgba(80, 80, 80, 0.75);
			min-width: 8px;
			transform: translate(0px, 11px);
			transition: transform 0.1s linear}
		:not(select):not(hbox) > scrollbar:hover {
			background-color: transparent}
		:not(select):not(hbox) > scrollbar:hover thumb {
			background-color: rgba(100, 100, 100, 0.5)!important;
			border-left: 0px;
			border-top: 0px;
			transform: translate(0px, 0px);
			transition: transform 0.1s linear}
		:not(select):not(hbox) > scrollbar thumb:hover {
			background-color: rgba(100, 100, 100, 0.8)!important}
		:not(select):not(hbox) > scrollbar thumb:active {
			background-color: rgba(110, 110, 110, 1)!important}
		:not(select):not(hbox) > scrollbar scrollbarbutton, :not(select):not(hbox) > scrollbar gripper {
			display: none}
	`;

	var sss = Cc['@mozilla.org/content/style-sheet-service;1'].getService(Ci.nsIStyleSheetService);
	var uri = makeURI('data:text/css;charset=UTF=8,' + encodeURIComponent(css));
    sss.loadAndRegisterSheet(uri, sss.AGENT_SHEET);
})();