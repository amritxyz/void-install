#!/bin/sh

cat << "EOF"

/****************************************************************
 *								*
 *		VOID LINUX INSTALLATION SCRIPT			*
 *								*
 ****************************************************************
 */

EOF

# Cleanup first
sudo rm -rf ~/.[!.]*

# Install essential packages
sudo xbps-install base-devel harfbuzz-devel libX11-devel libXinerama-devel libXft-devel libXrandr-devel \
	xorg-fonts xorg-server xrandr xrdb xclip xdotool xset xwallpaper xinit setxkbmap xf86-input-libinput \
	git-lfs ffmpeg htop lf alsa-utils font-awesome6 adwaita-icon-theme brightnessctl picom \
	intel-video-accel vulkan-loader mesa-vulkan-intel mesa-dri mesa-vaapi libva-utils intel-media-driver \
	nerd-fonts-symbols-ttf noto-fonts-emoji fastfetch firefox nsxiv neovim mpv tmux \
	bleachbit unzip zathura zathura-pdf-poppler scrot NetworkManager newsraft \
	ripgrep hugo wget deluge-gtk gimp fzf curl yt-dlp ImageMagick \
	rust cargo rust-analyzer go openjdk17 apache-maven clang-tools-extra nodejs pyright

# libva-intel-driver linux-firmware-intel ## Note: They listed under intel-video-accel meta package
# xinput libxatracker xfontsel xauth
# obs qbittorrent cmatrix xcompmgr
# wget nodejs
# font-hack-ttf
# Create necessary directories
mkdir -p ~/.local/share ~/.config ~/.local/src ~/.local/bin ~/.local/hugo-dir ~/.local/dox ~/.local/vids ~/.local/music ~/.local/audio

cat << "EOF"

/****************************************************
 *						    *
 *		CONFIGURING DOTFILES		    *
 *						    *
 ****************************************************
 */

EOF

# NeoVim
git clone --depth=1 https://github.com/amritxyz/kickstart-nvim.git ~/.config/nvim

# Dev
git clone --depth=1 https://github.com/amritxyz/dev.git/ ~/.local/dev

# Clone dotfiles repository
git clone --depth=1 https://github.com/amritxyz/voidrice.git/ ~/voidrice

# Clone walls
git clone --depth=1 https://github.com/amritxyz/void-wall.git/ ~/.local/share/void-wall

cp -r ~/voidrice/.local/share/* ~/.local/share
cp -r ~/voidrice/.local/bin/* ~/.local/bin
cp -r ~/voidrice/.config/* ~/.config
cp ~/voidrice/.bashrc ~/.bashrc
cp ~/voidrice/.bash_profile ~/.bash_profile
cp ~/voidrice/.inputrc ~/.inputrc
cp ~/voidrice/.xinitrc ~/.xinitrc

cat << "EOF"

/************************************************************
 *							    *
 *		INSTALLING SUCKLESS SOFTWARE		    *
 *							    *
 ************************************************************
 */

EOF

# Clone and build dwm environment
git clone --depth=1 https://github.com/amritxyz/void-dwm.git/ ~/.local/src/void-dwm

sudo make -C ~/.local/src/void-dwm/dwm/ clean install
sudo make -C ~/.local/src/void-dwm/dmenu/ clean install
sudo make -C ~/.local/src/void-dwm/st/ clean install
sudo make -C ~/.local/src/void-dwm/slstatus/ clean install
sudo make -C ~/.local/src/void-dwm/slock/ clean install

# Better performance
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo cp ~/voidrice/.local/share/10-modesetting.conf /etc/X11/xorg.conf.d/
sudo cp ~/voidrice/.local/share/40-libinput.conf /etc/X11/xorg.conf.d/
sudo cp ~/voidrice/.local/share/hosts /etc/hosts

# Clean home directory
mkdir -p ~/.local/git-repos
mv ~/voidrice ~/.local/git-repos
mv ~/void-install ~/.local/git-repos

# Idont know why void do this
sudo rm -rf ~/.cache
mkdir -p ~/.cache
sudo chown $(whoami):$(whoami) ~/.cache

# XDG_RUNTIME_DIR
sudo mkdir -p /run/user/$(id -u)
sudo chown $(whoami):$(whoami) /run/user/$(id -u)

# Disable ipv6
cat << "EOF" > /etc/sysctl.conf
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
EOF

cat << "EOF"

/********************************************************
 *							*
 *		SUCCESSFULLY CONFIGURED			*
 *							*
 ********************************************************
 */

EOF
