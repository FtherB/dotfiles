// settings
api.Hints.setCharacters('sadfjklewcmpgh');
api.Hints.style(" \
    font-family: Input Sans Condensed,Charcoal, sans-serif; \
    font-size: 10px; \
    font-weight: 300; \
    border: unset; \
    padding: 3px; \
    color: #8ac8ff; \
    background: unset; \
    background-color: #383838; \
");

// keymaps
api.map('H','S'); // back
api.map('L','D'); // forward
api.map('J','E'); // previous tab
api.map('K','R'); // next tab

api.map('D','P'); // scroll full page down
api.map('F','cf'); // open in background
api.map('t','on'); // open new tab
api.map('ou','go') // open url

// theme

settings.theme = `
:root {
    --bg: #333333;
    --accent-fg: #002352;
}
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme #sk_frame {
    background: var(--bg)
    opacity: 0.2;
    color: var(accent-fg);
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 10pt;
}`;

settings.blacklistPattern = /mail.google.com/;
