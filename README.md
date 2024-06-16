# dotfiles

for Mac with Apple Silicon

<details><summary>directory tree</summary>
<div>
<pre>

.
├── .bin
│   ├── brew.sh
│   ├── init_linux.sh
│   ├── init_mac.sh
│   ├── install_nvim.sh
│   ├── link_mac.sh
│   ├── pip.sh
│   ├── reinstall_nvim.sh
│   ├── set_defaults_mac.sh
│   └── upgrade.sh
├── .gitignore
├── Makefile
├── Makefile_linux
├── Makefile_mac
├── README.md
├── config
│   ├── .latexmkrc
│   ├── .warp
│   │   └── themes
│   │       ├── f_jp.yaml
│   │       └── f_milky.yaml
│   ├── git
│   │   ├── .gitconfig
│   │   ├── .gitconfig_s255
│   │   └── .gitignore_global
│   └── zsh
│       ├── .zprofile
│       ├── .zshrc
│       ├── _git
│       ├── git-completion.bash
│       └── git-prompt.sh
├── graveyard
│   └── packer_setup
│       ├── init.lua
│       └── plugins.lua
├── manual
│   ├── dir.md
│   └── git.md
└── nvim
    ├── .gitignore
    ├── README.md
    ├── after
    │   └── plugin
    │       ├── im-select.lua
    │       ├── indent-blankline.lua
    │       ├── nightfox.lua
    │       ├── treesitter.lua
    │       └── vimtex.lua
    ├── init.lua
    ├── lazy-lock.json
    └── lua
        ├── autocmd.lua
        ├── keymaps.lua
        ├── lsps.lua
        ├── options.lua
        ├── plugins
        │   ├── nvim_tree.lua
        │   ├── others.lua
        │   └── vimtex.lua
        ├── plugins.lua
        └── toggle.lua
</pre>
</div></details>

## Contents
nvim (neovim settings)

zsh

tmux (WIP)

## Note
- Run reinstall\_nvim.sh when cmake is updated.
