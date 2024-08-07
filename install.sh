cat << "EOF"


------------------------------------------------
 __   __   _    _     _     ___
 \ \ / /__(_)__| |  _| |_  |   \__ __ ___ __
  \ V / _ \ / _` | |_   _| | |) \ V  V / '  \
   \_/\___/_\__,_|   |_|   |___/ \_/\_/|_|_|_|

------------------------------------------------


EOF

# Install essential packages
sudo xbps-install xorg base-devel harfbuzz-devel libX11-devel libXinerama-devel \
	libXft-devel brightnessctl xwallpaper htop xset xdotool lf alsa-utils font-awesome6 \
	font-hack-ttf nerd-fonts-symbols-ttf noto-fonts-emoji picom fastfetch firefox nsxiv neovim mpv newsboat sxhkd \
	bleachbit unzip zathura zathura-pdf-poppler

# Clone dotfiles repository
git clone --depth=1 https://gitlab.com/amrit-44404/voidrice $HOME/voidrice

# Create necessary directories
mkdir -p $HOME/.local/share $HOME/.config $HOME/.local/src

# Copy configuration files
cat << "EOF"

=> copying configs from dotfiles"

EOF
cp -r $HOME/voidrice/.local/share/* $HOME/.local/share
\cp -r $HOME/voidrice/.config/* $HOME/.config
\cp $HOME/voidrice/.bashrc $HOME/.bashrc
\cp $HOME/voidrice/.xinitrc $HOME/.xinitrc

# Clone walls
git clone --depth=1 https://gitlab.com/amrit-44404/void-wall $HOME/.local/share/void-wall

# Clone and build dwm environment
git clone --depth=1 https://gitlab.com/amrit-44404/void-dwm $HOME/.local/src/void-dwm

sudo make -C ~/.local/src/void-dwm/dwm/ clean install
sudo make -C ~/.local/src/void-dwm/dmenu/ clean install
sudo make -C ~/.local/src/void-dwm/st/ clean install
sudo make -C ~/.local/src/void-dwm/slstatus/ clean install

cat << "EOF"

=> Installation completed successfully.

EOF

# End of script
