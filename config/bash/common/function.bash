function mkd() {
    {
        mkdir -p $1
        builtin cd $1
    }
}
