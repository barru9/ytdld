#!/data/data/com.termux/files/usr/bin/bash

# ANSI Escape Codes for Colors
BL='\e[01;90m'
R='\e[01;91m'
G='\e[01;92m'
Y='\e[01;93m'
LG='\e[01;37m'
N='\e[0m'
L='\033[7m'
X='\033[0m'

# Function to display header
print_header() {
    clear
    echo -e "${LG}------------------------------------------------${N}\n"
    echo -e "${R}        BARRU BEAST ${N}"
    sleep 0.3
    echo -e "${R}       BARRU BEAST ${N}"
    sleep 0.3
    echo -e "${R}      BARRU BEAST ${N}"
    sleep 0.3
    echo -e "${R}     BARRU BEAST ${N}"
    sleep 0.3
    echo -e "${R}    BARRU BEAST${N}"
    echo -e "\n\n${LG}------------------------------------------------${N}\n"
    sleep 1.5
}

# Function to update packages
update_packages() {
    echo -e "${Y}${L}\n Files Update kar raha hu Sabr rkh!... \n${N}"
    pkg update && pkg upgrade -y
    clear
}

# Function to install Python and dependencies
install_python() {
    echo -e "${Y}${L}\n Python install kar raha hu ab... ${N}"
    pkg install python -y
    pkg install python-pip -y
    clear
    sleep 0.2
}

# Function to install ffmpeg
install_ffmpeg() {
    echo -e "${Y}${L}\n ffmpeg install kr raha hu... \n${N}"
    pkg install ffmpeg -y
    clear
}

# Function to install wget
install_wget() {
    echo -e "${Y}${L}\n wget install kar raha hu \n${N}"
    pkg install wget -y
    clear
    sleep 0.2
}

# Function to install YouTube-dl
install_youtube_dl() {
    echo -e "${Y}${L}\n Ab jake main files install kr raha hu, Sabr rkh thoda aur... \n${N}"
    pip install yt-dlp
    pip install yt-dlp -U
    clear
}

# Function to set up configurations
setup_configs() {
    echo -e "${Y}${L}\n Settings kar raha hu..." $G" BARRU BEAST \n${N}"
    sleep 2
    echo -e "${Y}${L}\n Tere phone mein Youtube ka folder bana raha hu, wahi pe sab video dlod hoga :-) \n${N}"
    mkdir -p ~/storage/shared/YouTube
    sleep 1.5
    echo -e "${Y}${L}\n Dloder ka config kr raha hu... \n${N}"
    rm -rf ~/.config/yt-dlp
    mkdir -p ~/.config/yt-dlp
    sleep 1.5
    echo -e "${Y}${L}\n Wo config le raha hu kaam hai tu kia karega janke :-) \n${N}"
    wget -q https://raw.githubusercontent.com/Ak500k/termux-ydl/main/config -P ~/.config/yt-dlp
    cd ~/.config/yt-dlp || exit 1
    chmod +x config
    sleep 1
}

# Function to set up executable scripts
setup_executables() {
    echo -e "${Y}${L}\n Bin folder bana rha hu... \n${N}"
    mkdir -p ~/bin
    sleep 1.5
    echo -e "${Y}${L}\n Files le raha hu firse kaam lag gaya... \n${N}"
    rm -rf ~/bin/termux-url-opener
    wget -q https://raw.githubusercontent.com/Ak500k/termux-ydl/main/termux-url-opener -P ~/bin
    cd ~/bin || exit 1
    chmod +x termux-url-opener
    clear
}

# Main execution flow
main() {
    print_header
    update_packages
    print_header
    echo -e "${Y}${L}\n Yotobh Vido Dloder by" $G" BARRU BEAST \n${N}"
    install_python
    echo -e "${Y}${L}\n ffmpeg install kar rahs hu... \n${N}"
    install_ffmpeg
    update_packages
    install_wget
    install_youtube_dl
    setup_configs
    setup_executables
    echo -e "${Y}${L}\n Bas hone wala he hai..." $G" BARRU BEAST \n${N}"
    sleep 3.5
    echo -e "${G}\n   LE HOGAYA POORA AB BHAG YAHA SE :-) \n${N}"
    kill -1 $PPID
}

# Execute main function
main
