#!/bin/bash

#Check basic requirements
requirement_checker(){
    if ! command -v go >/dev/null 2>&1
    then
        root_checker
    else
        tools_installer
    fi 
}

#Installer functions
tools_installer(){
    go_tools
    py_tools
}

go_install(){
    echo 'Installing Go Lang...'
    sudo apt install golang-go
    go_tools_installer
}

go_tools(){
    go install -v github.com/tomnomnom/assetfinder@latest
    go install -v github.com/tomnomnom/httprobe@latest
    go install -v github.com/tomnomnom/meg@latest
    go install -v github.com/tomnomnom/gf@latest
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    go install -v github.com/ffuf/ffuf@latest
    echo ''
    echo 'Installing Amass'
    echo 'Do not freak out if it looks stuck... or freak out whatever you want'
    go install -v github.com/OWASP/Amass/v3/...@master
}

py_tools(){
    mkdir ~/recontools && cd ~/recontools
    git clone https://github.com/aboul3la/Sublist3r.git
}

#Check root status
root_checker(){
    if [ "${userid}" != '0' ]; then
        echo '[Error]: You do not have go installed if you want you can manually install with "sudo apt install golang-go" or you can run this installer script with root privileges to install go.'
        echo
        exit 1
    else
        go_install
    fi
}

requirement_checker



 
