cat << "EOF"

/****************************************************************
 *								*
 *		VOID LINUX INSTALLATION SCRIPT			*
 *								*
 ****************************************************************
 */

EOF

# Install essential packages
sudo xbps-install xorg base-devel harfbuzz-devel libX11-devel libXinerama-devel libXft-devel \
	ffmpeg xwallpaper htop xclip xset xdotool lf alsa-utils font-awesome6 adwaita-icon-theme \
	nerd-fonts-symbols-ttf noto-fonts-emoji slock xcompmgr fastfetch firefox nsxiv neovim mpv newsraft \
	bleachbit unzip zathura zathura-pdf-poppler scrot xf86-video-intel NetworkManager tmux \
	rust go ripgrep hugo wget transmission

# gimp obs
# wget nodejs
# font-hack-ttf
# Create necessary directories
mkdir -p $HOME/.local/share $HOME/.config $HOME/.local/src $HOME/.local/bin $HOME/.local/hugo-dir $HOME/.local/dox $HOME/.local/vids

cat << "EOF"

/****************************************************
 *						    *
 *		CONFIGURING DOTFILES		    *
 *						    *
 ****************************************************
 */

EOF

# NeoVim
git clone --depth=1 https://gitlab.com/NyxVoid/nvim.git $HOME/.config/nvim

# Dev
git clone --depth=1 https://gitlab.com/NyxVoid/dev.git/ $HOME/.local/dev

# Clone dotfiles repository
git clone --depth=1 https://gitlab.com/NyxVoid/voidrice.git/ $HOME/voidrice

# Clone walls
git clone --depth=1 https://gitlab.com/NyxVoid/void-wall.git/ $HOME/.local/share/void-wall

cp -r $HOME/voidrice/.local/share/* $HOME/.local/share
cp -r $HOME/voidrice/.local/bin/* $HOME/.local/bin
cp -r $HOME/voidrice/.config/* $HOME/.config
cp $HOME/voidrice/.bashrc $HOME/.bashrc
cp $HOME/voidrice/.inputrc $HOME/.inputrc
cp $HOME/voidrice/.xinitrc $HOME/.xinitrc

cat << "EOF"

/************************************************************
 *							    *
 *		INSTALLING SUCKLESS SOFTWARE		    *
 *							    *
 ************************************************************
 */

EOF

# Clone and build dwm environment
git clone --depth=1 https://gitlab.com/NyxVoid/void-dwm.git/ $HOME/.local/src/void-dwm

sudo make -C $HOME/.local/src/void-dwm/dwm/ clean install
sudo make -C $HOME/.local/src/void-dwm/dmenu/ clean install
sudo make -C $HOME/.local/src/void-dwm/st/ clean install
sudo make -C $HOME/.local/src/void-dwm/slstatus/ clean install

# Better performance
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo cp $HOME/voidrice/.local/share/20-intel.conf /etc/X11/xorg.conf.d/
sudo cp $HOME/voidrice/.local/share/hosts /etc/hosts

# Clean home directory
mkdir -p $HOME/.local/git-repos
mv $HOME/voidrice $HOME/.local/git-repos
mv $HOME/void-install $HOME/.local/git-repos
rm -rf $HOME/.bash_profile $HOME/.xprofile

# Idont know why void do this
sudo rm -rf $HOME/.cache
mkdir -p $HOME/.cache
sudo chown void:void $HOME/.cache

cat << "EOF"

/********************************************************
 *							*
 *		SUCCESSFULLY CONFIGURED			*
 *							*
 ********************************************************
 */

EOF
