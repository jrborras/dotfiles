#!/usr/bin/env bash
LOG="${HOME}/dotfiles/logs/dotfiles.log"
GITHUB_USER=jrborras
GITHUB_REPO=dotfiles
DIR="${HOME}"
DIR+="/"
DIR+="${GITHUB_REPO}"
DATE="$(date +%s)"

fun_copia(){
    echo "[INFO] copia de seguretat"
    # comprova que dotfiles/old_files existeix
    if [[ -d "$DIR/old_files" ]]
    then
        echo ""
    else
        mkdir "$DIR/old_files" > /dev/null
    fi
    # copia .bashrc
    if [[ -e "$HOME/.bashrc" ]]
    then
        #echo "[INFO] arxiu .bashrc si existeix"
        mv "$HOME/.bashrc" "$DIR/old_files/.bashrc-$DATE"
    fi
    # copia .bash_profile
    if [[ -e "$HOME/.bash_profile" ]]
    then
        #echo "[INFO] arxiu .bashrc si existeix"
        mv "$HOME/.bash_profile" "$DIR/old_files/.bash_profile-$DATE"
    fi

    # copia .bash_prompt
    if [[ -e "$HOME/.bash_prompt" ]]
    then
        #echo "[INFO] arxiu .bashrc si existeix"
        mv "$HOME/.bash_prompt" "$DIR/old_files/.bash_prompt-$DATE"
    fi

    # copia .vimrc
    if [[ -e "$HOME/.vimrc" ]]
    then
      #echo "[INFO] arxiu .vimrc si existeix"
      mv "$HOME/.vimrc" "$DIR/old_files/.vimrc-$DATE"
    fi
}

fun_stow(){
    # verifica que stow està instalat
    which stow > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Stow està instalat"
    else
        echo "Stow no està instalat"
        sudo apt install stow
    fi
}

fun_slink() {
    # realitza symlinks dels arxius
    echo "[INFO] fent symliks"
    cd $DIR
    stow bash
    stow vim
}

echo "[INFO] iniciant script"

fun_copia
fun_stow
fun_slink

exit 0
