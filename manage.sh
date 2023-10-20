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
        cp "$HOME/.bashrc" "$DIR/old_files/.bashrc-$DATE"
    fi
    # copia .bash_profile
    if [[ -e "$HOME/.bash_profile" ]]
    then
        #echo "[INFO] arxiu .bashrc si existeix"
        cp "$HOME/.bash_profile" "$DIR/old_files/.bash_profile-$DATE"
    fi

    # copia .bash_prompt
    if [[ -e "$HOME/.bash_prompt" ]]
    then
        #echo "[INFO] arxiu .bashrc si existeix"
        cp "$HOME/.bash_profile" "$DIR/old_files/.bash_prompt-$DATE"
    fi
}

fun_slink() {
    # realitza symlinks dels arxius
    echo "[INFO] fent symliks"
    ln -fs "${DIR}/bash/aliases" "${HOME}/aliases"
    ln -fs "${DIR}/bash/.bash_prompt" "${HOME}/.bash_prompt"
    ln -fs "${DIR}/bash/.bash_profile" "${HOME}/.bash_profile"
    ln -fs "${DIR}/bash/.bashrc" "${HOME}/.bashrc"

}

echo "[INFO] iniciant script"

fun_copia
fun_slink

exit 0
