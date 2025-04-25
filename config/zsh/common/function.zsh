# latexmkrc
function latexengine() {
    sh ${HOME}/dotfiles/bin/latexengine.sh $1
}

function makereport() {
    help() {
        echo "Usage: makereport [directory_name]"
    }
    for dir in $*
    do
        case $dir in
            help)
                help
                return
                ;;
            *)
                sh ${HOME}/dotfiles/bin/makereport.sh $dir
                return
                ;;
        esac
    done
    help
    return 1
}

# mkdir and cd
function mkd() {
    {
        mkdir -p $1
        builtin cd $1
    }
}
