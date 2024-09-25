# cowsay 'NIGHTMARE BEGINNING...'

# split zsh
ZSHDIR="${HOME}/dotfiles/config/zsh"
if [ -d $ZSHDIR ] && [ -r $ZSHDIR ] && [ -x $ZSHDIR ]; then
    for file in ${ZSHDIR}/common/**/*.zsh; do
        [ -r $file ] && source $file
    done
    if [ `uname` = "Darwin" ]; then
        for filem in ${ZSHDIR}/mac/**/*.zsh; do
            [ -r $filem ] && source $filem
        done
    fi
fi
