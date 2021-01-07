<h1 align="center">Sweet_Pop!</h1>

<!-- <h3 align="center">Preview</h3> -->
<p align="center"><img src="./assets/preview.png"></p>

<h3 align="center">Floating Navigation</h3>
<p align="center"><img src="./assets/float.gif"></p>

<h3 align="center">Auto-hide Scrollbars</h3>
<p align="center"><img src="./assets/scrollbar.gif"></p>

<h3 align="center">Context Menu</h3>
<p align="center"><img src="./assets/context.png"></p>

<h3 align="center">Library</h3>
<p align="center"><img src="./assets/library.png"></p>

## `userChrome.css`
This helps to customize Firefox User Interface.

## `userContent.css`
This helps to customize Firefox web content like a specific site.

## `hide scrollbar.uc.js`
It's possible to autohide scrollbars now.

### **But how does it work?**
Custom startup-script (aka `mozilla.cfg` here) is loaded using `local-settings.js`. This startup-script adds "loader" scripts from `utils` folder that loads arbitrary javascript files from the profile folder into Firefox (`hide scrollbar.uc.js` in this case)<br>
`mozilla.cfg` also helps in setting local webpage as your homepage. Details in [Install](#Install).

NOTE: Firefox team has removed XBL from Firefox starting with version 72, so userChrome.js would not work :/

## Install
1) In `about:config` check that `toolkit.legacyUserProfileCustomizations.stylesheets` is set to `true`

2) Open `about:support` in new tab and click `Open Directory` near `Profile Directory` or simply copy the location

3) Clone the repository (my `Profile Directory` is `/home/proxima/.mozilla/firefox-trunk/uwrdytgn.proxima`)

Note: If you alrady have a `chrome` folder under `Profile Directory`, rename it to `chrome2` or anything else so that after trying this theme you can easily restore your theme.

```console
proxima@proxzima:~$ cd {Your profile directory}

proxima@proxzima:~/.mozilla/firefox-trunk/uwrdytgn.proxima$ git clone https://github.com/PROxZIMA/Firefox-Theme.git chrome

proxima@proxzima:~/.mozilla/firefox-trunk/uwrdytgn.proxima$ cd chrome

proxima@proxzima:~/.mozilla/firefox-trunk/uwrdytgn.proxima/chrome$
```

NOTE: If you are planning to set a local page as home page then in `mozilla.cfg` at line 7 change `newTabURL_` to the local page location

4) Move `mozilla.cfg` and `local-settings.js` to their destination (On Linux, Non-Nightly users replace `firefox-trunk` with `firefox`; On Windows look for firefox folder under `Program Files (x86)`)

Linux / OS X
```console
proxima@proxzima:~/.mozilla/firefox-trunk/uwrdytgn.proxima/chrome$ mv local-settings.js /usr/lib/firefox-trunk/

proxima@proxzima:~/.mozilla/firefox-trunk/uwrdytgn.proxima/chrome$ mv mozilla.cfg /usr/lib/firefox-trunk/defaults/pref/
```
Windows
```console
> move local-settings.js "C:\Program Files (x86)\Mozilla Firefox\"

> move mozilla.cfg "C:\Program Files (x86)\Mozilla Firefox\defaults\pref\"
```

5) In Firefox, right click hamburger button > `customize toolbar` disable `Title Bar`, `Drag Space`, set Density to `compact` and Themes to `dark` or `light` :/

6) Open `about:support` > `Clear startup cache...` > `Restart`

7) **Voilà**

## Folder structure
.<br>
├── icons<br>
│  ├── close_hover.svg<br>
│  ├── close.svg<br>
│  ├── fox-transparent.gif<br>
│  ├── infoico.png<br>
│  ├── max_hover.svg<br>
│  ├── max_restore.svg<br>
│  ├── min_hover.svg<br>
│  ├── min.svg<br>
│  ├── restore_hover.svg<br>
│  ├── sonic.gif<br>
│  ├── tab-loading.png<br>
│  └── welcome-back.svg<br>
├── assets<br>
│  ├── context.png<br>
│  ├── float.gif<br>
│  ├── library.png<br>
│  ├── preview.png<br>
│  └── scrollbar.gif<br>
├── hide scrollbar.uc.js<br>
├── local-settings.js<br>
├── mozilla.cfg<br>
├── README.md<br>
├── userChrome.css<br>
├── userContent.css<br>
└── utils<br>
   ├── boot.jsm<br>
   ├── BootstrapLoader.jsm<br>
   ├── chrome.manifest<br>
   ├── userChrome.jsm<br>
   ├── userPrefs.jsm<br>
   └── xPref.jsm<br>

## Tips
1) To disable floating toolbox, Comment or remove lines 40-44 in `userChrome.css`
2) To disable Auto-hide scrollbars you can simply rename `hide scrollbar.uc.js`'s extension to anything other than `uc.js`. You can also edit it to adjust the scrollbars according to your taste
3) You can change theme to `Light` from the customize page

## Credits
- The_Other_Guy helped me a lot on [r/FirefoxCSS](https://www.reddit.com/r/FirefoxCSS/) : [u/It_Was_The_Other_Guy](https://www.reddit.com/user/It_Was_The_Other_Guy)

- I started with this amazing material theme : [MaterialFox](https://github.com/muckSponge/MaterialFox) by [muckSponge](https://github.com/muckSponge)

- One of the best dark theme for Firefox : [ShadowFox](https://overdodactyl.github.io/ShadowFox) by [overdodactyl](https://github.com/overdodactyl)

- Floating Toolbox : [u/oldworlds](https://www.reddit.com/r/FirefoxCSS/comments/koa71w/minimalfox_a_compact_and_minimal_theme/)

- [Theme inspiration](https://www.reddit.com/r/FirefoxCSS/comments/ci7i69/another_oneline_theme/) by [u/SENDMEJUDES](https://www.reddit.com/user/SENDMEJUDES/)

- [Setting local page as homepage](https://www.reddit.com/r/firefox/comments/ge86z4/newtab_page_to_local_file_firefox_76_redux/)

- Auto hide scrollbars : details [here](https://www.reddit.com/r/FirefoxCSS/comments/jptrf8/is_it_still_possible_to_autohide_and_show/) by [u/mimecry](https://www.reddit.com/user/mimecry/)

- My favorite [startpage](https://www.reddit.com/r/startpages/comments/hfuoqg/a_simple_startpage_i_have_been_working_on/)

___
<p align="center">Made with ❤️</p>
<h2 align="center">ARIGATOU</h2>