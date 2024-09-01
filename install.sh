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
	font-hack-ttf nerd-fonts-symbols-ttf noto-fonts-emoji slock xcompmgr fastfetch firefox nsxiv neovim mpv newsboat \
	bleachbit unzip zathura zathura-pdf-poppler scrot xf86-video-intel NetworkManager

# Clone dotfiles repository
git clone --depth=1 https://gitlab.com/amrit-44404/voidrice $HOME/voidrice

# Create necessary directories
mkdir -p $HOME/.local/share $HOME/.config $HOME/.local/src $HOME/.local/bin $HOME/.local/hugo-dir

# Copy configuration files
cat << "EOF"

=> copying configs from dotfiles"

EOF
cp -r $HOME/voidrice/.local/share/* $HOME/.local/share
\cp -r $HOME/voidrice/.local/bin/* $HOME/.local/bin
\cp -r $HOME/voidrice/.config/* $HOME/.config
\cp $HOME/voidrice/.bashrc $HOME/.bashrc
\cp $HOME/voidrice/.inputrc $HOME/.inputrc
\cp $HOME/voidrice/.xinitrc $HOME/.xinitrc

# Clone walls
git clone --depth=1 https://gitlab.com/amrit-44404/void-wall $HOME/.local/share/void-wall

# Clone and build dwm environment
git clone --depth=1 https://gitlab.com/amrit-44404/void-dwm $HOME/.local/src/void-dwm

sudo make -C ~/.local/src/void-dwm/dwm/ clean install
sudo make -C ~/.local/src/void-dwm/dmenu/ clean install
sudo make -C ~/.local/src/void-dwm/st/ clean install
sudo make -C ~/.local/src/void-dwm/slstatus/ clean install

#sudo mkdir -p /etc/X11/xorg.conf.d/
#sudo cp $HOME/voidrice/.local/share/20-intel.conf /etc/X11/xorg.conf.d/
sudo cp $HOME/voidrice/.local/share/hosts /etc/hosts

# Clean home directory
mkdir -p $HOME/.local/git-repos
mv $HOME/voidrice $HOME/.local/git-repos
mv $HOME/void-install $HOME/.local/git-repos

cat << "EOF"


--------------------------------------------------------------------------------------------
  ___                       __      _ _         ___           __ _                      _
 / __|_  _ __ __ ___ ______/ _|_  _| | |_  _   / __|___ _ _  / _(_)__ _ _  _ _ _ ___ __| |
 \__ \ || / _/ _/ -_|_-<_-<  _| || | | | || | | (__/ _ \ ' \|  _| / _` | || | '_/ -_) _` |
 |___/\_,_\__\__\___/__/__/_|  \_,_|_|_|\_, |  \___\___/_||_|_| |_\__, |\_,_|_| \___\__,_|
                                        |__/                      |___/
--------------------------------------------------------------------------------------------


EOF
