export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"

fortune

# wezterm wallpaper
# For details, see wezterm.lua
wp_dis="${HOME}/dotfiles/config/terminal/wezterm/.wp" 
if [ ! -e $wp_dis ];then
    touch $wp_dis
    echo '0' > $wp_dis
fi

function wezwp() {
    if [ -z "$1" ]; then
        cat $wp_dis
    elif [[ $1 =~ ([0-9]+) ]]; then
        echo $1 > $wp_dis
    else
        echo 'invalid argument'
    fi
    
}
