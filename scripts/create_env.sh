#!/bin/sh
# Initialize the environment

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

create_folder_tree(){
    echo "Creating the webserver tree ..."
    if [ ! -d "web" ]; then
        mkdir web 
        cd web
        for i in `seq 1 6`;
        do
            if [ ! -d "www$i" ]; then
                mkdir www$i
                echo "${GREEN}www$i folder created.${NOCOLOR}"
                cd www$i
                if [ ! -d "logs" ]; then
                    mkdir logs
                    echo "${GREEN}\tLogs for www$i created.${NOCOLOR}"
                    cd ../
                else
                    echo "Log for www$i already exists."
                fi
            else
                echo "www$i folder already exists."
            fi
        done
        cd ../
    else
        echo "${RED}web folder already exists.${NOCOLOR}"
    fi

    echo "Creating the reverse proxy tree ..."
    if [ ! -d "rp" ]; then
        mkdir rp
        echo "${GREEN}Folder rp created.${NOCOLOR}"
        cd rp
        if [ ! -d "logs" ]; then
            mkdir logs
            echo "${GREEN}\tLogs for rp created.${NOCOLOR}"
            cd ../
        else
                echo "Log for rp already exists."
            fi
    else
        echo "${RED}rp folder already exists.${NOCOLOR}"
    fi
}

create_html_files(){
    if [ -d "web" ]; then
        echo "Creating the HTML index files"
        cd web
        for i in `seq 1 6`;
        do
            if [ -d "www$i" ]; then
                cd www$i
                if [ ! -f "index.html" ]; then
                    echo "Creating www$i index.html file"
                    echo "<h1>Hello $i</h1>" > index.html
                    cd ../
                else
                    echo "index.html file already exists in www$i folder."
                fi
            else
                echo "Folder www$i doesn't exist"
            fi
        done
        cd ../
    else
        echo "${RED}You need to create web folder before${NOCOLOR}"
    fi
}

ask_permission(){
    text="$1"
    used_function="$2"

    while true
    do
    read -r -p "$text" input
    
    case $input in
        [yY][eE][sS]|[yY])
    $used_function
    break
    ;;
        [nN][oO]|[nN])
    break
            ;;
        *)
    echo "Invalid input..."
    ;;
    esac
    done
}

# Create folder tree
used_function="create_folder_tree"
text="Do you wish to create the folder tree ? [Y/n] "
ask_permission "$text" $used_function

# Create index files
used_function="create_html_files"
text="Do you wish to create the HTML index files ? [Y/n] "
ask_permission "$text" $used_function
