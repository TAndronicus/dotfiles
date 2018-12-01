#!/bin/zsh

workspace="Workspace/dotfiles"
absWorkspace="/home/jb/$workspace"
configDir=".config"

declare -a FUNCTION
FUNCTION+=("confPrezto")
FUNCTION+=("confSpaceship")
FUNCTION+=("confVim")
FUNCTION+=("confNeovim")
FUNCTION+=("confGit")
FUNCTION+=("confTmux")
FUNCTION+=("confIdea")
FUNCTION+=("confOhMyZsh")
FUNCTION+=("confFont")
FUNCTION+=("confKeys")

prefix="conf"

function confPrezto {
    if [ -f .zshrc ]; then
        sudo rm .zshrc
    fi
    ls $workspace/prezto | xargs -I repl ln -s $workspace/prezto/repl .repl
}
function confVim {
    ln -s $workspace/.vimrc .vimrc
}
function confNeovim {
    cd $configDir/nvim
    if [ -f init.vim ]; then
        echo kurwa
        sudo rm init.vim
    fi
    ln -s $absWorkspace/init.vim init.vim
    cd
}
function confGit {
    if [ -f .gitconfig ]; then
        sudo rm .gitconfig
    fi
    ln -s $workspace/.gitconfig .gitconfig
}
function confTmux {
    ln -s $workspace/.tmux.conf .tmux.conf
}
function confIdea {
    ln -s $workspace/.ideavimrc .ideavimrc
}
function confOhMyZsh {
    if [ -f .zshrc ]; then
        sudo rm .zshrc
    fi
    ln -s $workspace/.zshrc .zshrc
}
function confFont {
    noto="99-noto-mono-color-emoji.conf"
    if [ ! -d $configDir ]; then
        mkdir $configDir
    fi
    fontDir="$configDir/fontconfig"
    if [ ! -d $fontDir ]; then
        mkdir $fontDir
    fi
    startupDir="$fontDir/conf.d"
    if [ ! -d $startupDir ]; then
        mkdir $startupDir
    fi
    cp -f ~/$workspace/$noto ~/$startupDir/$noto
    fc-cache
}
function confSpaceship {
    spaceship="/usr/lib/spaceship-prompt"
    if [ -f $spaceship/spaceship.zsh ]; then
        sudo rm $spaceship/spaceship.zsh
    fi
    if [ -f $spaceship/sections/java.zsh ]; then
        sudo rm $spaceship/sections/java.zsh
    fi
    cd $spaceship
    sudo ln -s $absWorkspace/spaceship.zsh spaceship.zsh
    cd sections
    sudo ln -s $absWorkspace/java.zsh java.zsh
    cd
}
function confKeys {
    keysFile="kglobalshortcutsrc"
    cd $configDir
    sudo rm $keysFile
    ln -s $absWorkspace/$keysFile $keysFile
    cd
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
