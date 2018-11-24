#!/bin/zsh

workspace="Workspace/dotfiles"

declare -a FUNCTION
FUNCTION+=("confPrezto")
FUNCTION+=("confVim")
FUNCTION+=("confGit")
FUNCTION+=("confTmux")
FUNCTION+=("confIdea")
FUNCTION+=("confOhMyZsh")

prefix="conf"

function confPrezto {
    rm .zshrc
    ls $workspace | grep z | xargs -I repl ln -s $workspace/repl .repl
}
function confVim {
    ln -s $workspace/.vimrc .vimrc
}
function confGit {
    rm .gitconfig
    ln -s $workspace/.gitconfig .gitconfig
}
function confTmux {
    ln -s $workspace/.tmux.conf .tmux.conf
}
function confIdea {
    ln -s $workspace/.ideavimrc .ideavimrc
}
function confOhMyZsh {
    rm .zshrc
    ln -s $workspace/.zshrc .zshrc
}

for ((i=0;i<${#FUNCTION[@]};i++))
do
    cd
    NAME=$(echo ${FUNCTION[$i]} | sed -e "s/^$prefix//" -e 's/\(.*\)/\L\1/')
    printf "\nConfig $NAME? [ynq]"
    read ins
    while [ $ins != 'y' ] && [ $ins != 'n' ] && [ $ins != 'q' ]
    do
        echo y - yes
        echo n - no
        echo q - quit
        echo Install $NAME?
        read ins
    done
    if [ $ins == 'y' ] || [ $ins == 'Y' ]
    then
        ${FUNCTION[$i]}
    elif [ $ins == 'n' ]
    then
        echo Skipping $NAME configuration.
    elif [ $ins == 'q' ]
    then
        echo Quitting configurer
        exit 1
    fi
done
