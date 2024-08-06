cat << "EOF"


------------------------------------------------
          _    _     _     _____      ____  __
 __ _____(_)__| |  _| |_  |   \ \    / |  \/  |
 \ V / _ | / _` | |_   _| | |) \ \/\/ /| |\/| |
  \_/\___|_\__,_|   |_|   |___/ \_/\_/ |_|  |_|

------------------------------------------------


EOF

sudo xbps-install xorg base-devel harfbuzz-devel libX11-devel libXinerama-devel \
	libXft-devel brightnessctl xwallpaper htop xset lf alsa-utils font-awesome6 \
	nerd-fonts-symbols-ttf xcompmgr fastfetch firefox nsxiv neovim mpv newsboat sxhkd \
	bleachbit unzip zathura zathura-pdf-poppler

git clone --depth=1 https://gitlab.com/amrit-44404/voidrice $HOME/voidrice
mkdir -p $HOME/.local/share $HOME/.config $HOME/.local/src

echo "=> copying configs from dotfiles"

cp -r $HOME/voidrice/.local/share/* $HOME/.local/share
\cp -r $HOME/voidrice/.config/* $HOME/.config
\cp $HOME/voidrice/.bashrc $HOME/.bashrc
\cp $HOME/voidrice/.xinitrc $HOME/.xinitrc
cd $HOME/.local/share/ && ./wal

git clone --depth=1 https://gitlab.com/amrit-44404/void-dwm $HOME/.local/src/void-dwm

sudo make -C ~/.local/src/void-dwm/dwm/ clean install
sudo make -C ~/.local/src/void-dwm/dmenu/ clean install
sudo make -C ~/.local/src/void-dwm/st/ clean install
sudo make -C ~/.local/src/void-dwm/slstatus/ clean install
echo "=> installation completed"
