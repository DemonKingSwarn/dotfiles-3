// ==UserScript==
// @name 			Dark Reader (Unofficial)
// @icon 			https://darkreader.org/images/darkreader-icon-256x256.png
// @namespace 		DarkReader
// @description 	Inverts the brightness of pages
// @version 		4.7.15
// @homapeageURL 	https://darkreader.org | https://github.com/darkreader/darkreader
// @run-at 			document-begin
// @grant 			none
// @include 		http*
// @require 		https://cdn.jsdeLivr.net/npm/darkreader/darkreader.min.js
// @noframes
// ==/UserScript==


DarkReader.enable({
	brightness: 100,
	contrast: 100,
	sepia: 0
});