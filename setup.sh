#!/bin/bash

RED="$(printf '\033[31m')"  
GREEN="$(printf '\033[32m')"  
ORANGE="$(printf '\033[33m')"  
BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  
CYAN="$(printf '\033[36m')"  
WHITE="$(printf '\033[37m')" 
BLACK="$(printf '\033[30m')"
# bg
REDBG="$(printf '\033[41m')"  
GREENBG="$(printf '\033[42m')"  
ORANGEBG="$(printf '\033[43m')"  
BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  
CYANBG="$(printf '\033[46m')"  
WHITEBG="$(printf '\033[47m')" 
BLACKBG="$(printf '\033[40m')"

RESET="$(printf '\033[37m')"


check_distro() {
    distor=$(uname -a | grep -i -c "Ubuntu")
    if [ $distor -ne 1 ]; then
        echo -e "\n $RED 😈 Ubuntu Linux Not detected $RESET  \n";exit
    fi
}


check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo  -e "\n $RED 😱 Script must be run with as root $RESET \n";exit
    fi
}


# my tools list
my_tools() {
    echo -e "\n $GREEN 📦 Installing my tools $RESET \n"
    sudo apt update
    sudo apt install -y tmux vim curl git
    echo -e "\n $GREEN 📦 Done $RESET \n"
}

## install tmux gpakosz
gpakosz_tmux() {
    echo -e "\n $GREEN 📦 Installing gpakosz tmux $RESET \n"
    cd
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
    echo -e "\n $GREEN 📦 Done $RESET \n"
}

spacevim() {
    echo -e "\n $GREEN 📦 Installing SpaceVim $RESET \n"
    curl -sLf https://spacevim.org/install.sh | bash
    echo -e "\n $GREEN 📦 Done $RESET \n"
}

## Install Docker
docker_install() {
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
}


## User add to docker group
docker_user() {
    sudo usermod -aG docker $USER
    exec su -l $USER
}


# execute functions
check_distro
check_root
my_tools
gpakosz_tmux
spacevim
docker_install
docker_user

