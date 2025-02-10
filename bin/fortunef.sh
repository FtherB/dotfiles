#!/bin/bash

# echo $((RANDOM % 100))
#
case $((RANDOM % 3)) in
    0)
        echo 'サラマンダーより、ずっとはやい!!'
        ;;
    1)
        echo 'おかーさーん'
        echo 'おか・おか・おかーさーん・・・'
        echo 'おかーさーん・おか・おか・おかーさーん'
        echo 'おかーさーん・・・・・・・・・・・'
        echo '・・・・・・・・・・・・・・・・・・・'
        ;;
    2)
        echo '4'
        echo 'かゆい'
        echo 'うま'
        ;;
esac
