# cowsay 'NIGHTMARE BEGINNING...'

# split zsh
ZSHDIR="${HOME}/dotfiles/config/zsh"
if [ -d $ZSHDIR ] && [ -r $ZSHDIR ] && [ -x $ZSHDIR ]; then
    for file in ${ZSHDIR}/common/**/*.zsh; do
        [ -r $file ] && source $file
        # echo "source ${file}"
    done
    if [ -d ${ZSHDIR}/api ]; then
        for filea in ${ZSHDIR}/api/**/*.zsh; do
            [ -r $filea ] && source $filea
            # echo "source ${filea}"
        done
    fi

    if [ `uname` = "Darwin" ]; then
        for filem in ${ZSHDIR}/mac/**/*.zsh; do
            [ -r $filem ] && source $filem
            # echo "source ${filem}"
        done
    fi
fi


