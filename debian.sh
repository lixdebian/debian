#!/usr/bin/env bash
#
# debian.sh install,funciona debian 11 e 12 sem nenhuma problema !

# como executar o programa chmod 777 debian.sh
apt update & apt dist-upgrade -y & apt autoremove
# programas 
##URLS
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_STEAM="https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb"
#pasta downloads

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"
FILE="/home/$USER/.config/gtk-3.0/bookmarks"

# instalação pros programas
install_deb() {

# remover travas futuras do apt
travas_apt(){
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
# adicionar arquitetura de 32 bits
add_archi386(){
sudo dpkg --add-architecture i386
# atualizar o rep
apt update & apt dist-upgrade -y
# debs programas principais
flatpak
virtualbox
gpaterd
timeshitf
vlcflatpak
gnome-disk-utility
baobab
git
wget


#instalação downloads acima
install_debs(){

echo -e "${VERDE}[INFO] - Baixando pacotes .deb${SEM_COR}"
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_STEAM"               -P "DIRETORIO_DOWNLOADS"

# instalando pacotes .deb baixados na sessão anterior #
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb
# instalando via apt
apt install vlc emarcs inkscape krita gimp qimgv qbittorrent goverlay gpaterd gnome-disk-utility timeshitf flatpak gnome-software-plugin-flatpak
# repositorio do flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# instalação snap
apt update
apt install snapd
reboot
snap install core
snap install hello-world
#da uma reiniciada no sistema 
reboot
# instalar o wine 
dpkg --add-architecture i386 
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
apt update
apt install --install-recommends winehq-stable
