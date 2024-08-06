cat << "EOF"
  ___         _        _ _ _             ___                        _             _
 |_ _|_ _  __| |_ __ _| | (_)_ _  __ _  |   \ ___ _ __  ___ _ _  __| |___ _ _  __(_)___ ___
  | || ' \(_-<  _/ _` | | | | ' \/ _` | | |) / -_) '_ \/ -_) ' \/ _` / -_) ' \/ _| / -_|_-<
 |___|_||_/__/\__\__,_|_|_|_|_||_\__, | |___/\___| .__/\___|_||_\__,_\___|_||_\__|_\___/__/
                                 |___/           |_|

EOF

sudo xbps-install xorg base-devel harfbuzz-devel libX11-devel libXinerama-devel libXft-devel brightnessctl xwallpaper htop xset slock lf alsa-utils font-awesome6 nerd-fonts-symbols-ttf xcompmgr fastfetch firefox nsxiv neovim mpv newsboat sxhkd bleachbit unzip zathura zathura-pdf-poppler

cat << "EOF"


------------------------------------------------
          _    _     _     _____      ____  __
 __ _____(_)__| |  _| |_  |   \ \    / |  \/  |
 \ V / _ | / _` | |_   _| | |) \ \/\/ /| |\/| |
  \_/\___|_\__,_|   |_|   |___/ \_/\_/ |_|  |_|

------------------------------------------------


EOF
cd $HOME
cat << "EOF"

   ___ _          _            __   __   _    _     _
  / __| |___ _ _ (_)_ _  __ _  \ \ / ___(_)__| |_ _(_)__ ___
 | (__| / _ | ' \| | ' \/ _` |  \ V / _ | / _` | '_| / _/ -_)
  \___|_\___|_||_|_|_||_\__, |   \_/\___|_\__,_|_| |_\__\___|
                        |___/

----------------------------------------------------------

EOF
git clone --depth=1 https://gitlab.com/amrit-44404/voidrice
mkdir -p $HOME/.local/share
mkdir -p $HOME/.config
cat << "EOF"

=> copying configs from dotfiles

EOF
cp -r $HOME/voidrice/.local/share/* $HOME/.local/share
\cp -r $HOME/voidrice/.config/* $HOME/.config
\cp $HOME/voidrice/.bashrc $HOME/.bashrc
\cp $HOME/voidrice/.xinitrc $HOME/.xinitrc
cd $HOME/.local/share/ && ./wal
cd $HOME

cat << "EOF"

  ___        _     ___         _        _ _
 | _ \___ __| |_  |_ _|_ _  __| |_ __ _| | |
 |  _/ _ (_-|  _|  | || ' \(_-|  _/ _` | | |
 |_| \___/__/\__| |___|_||_/__/\__\__,_|_|_|

---------------------------------------------

EOF
mkdir -p $HOME/.local/src
cd $HOME/.local/src
cat << "EOF"

   ___ _          _                _
  / __| |___ _ _ (_)_ _  __ _   __| __ __ ___ __
 | (__| / _ | ' \| | ' \/ _` | / _` \ V  V | '  \
  \___|_\___|_||_|_|_||_\__, | \__,_|\_/\_/|_|_|_|
                        |___/

-------------------------------------------------

EOF

git clone --depth=1 https://gitlab.com/amrit-44404/void-dwm

cat << "EOF"
  ___         _        _ _ _                _
 |_ _|_ _  __| |_ __ _| | (_)_ _  __ _   __| __ __ ___ __
  | || ' \(_-|  _/ _` | | | | ' \/ _` | / _` \ V  V | '  \
 |___|_||_/__/\__\__,_|_|_|_|_||_\__, | \__,_|\_/\_/|_|_|_|
                                 |___/

----------------------------------------------------------

EOF
sudo make -C ~/.local/src/void-dwm/dwm/ clean install
sudo make -C ~/.local/src/void-dwm/dmenu/ clean install
sudo make -C ~/.local/src/void-dwm/st/ clean install
sudo make -C ~/.local/src/void-dwm/slstatus/ clean install


cat << "EOF"

  ___         _        _ _      _   _             ___                _     _          _
 |_ _|_ _  __| |_ __ _| | |__ _| |_(_)___ _ _    / __|___ _ __  _ __| |___| |_ ___ __| |
  | || ' \(_-|  _/ _` | | / _` |  _| / _ | ' \  | (__/ _ | '  \| '_ | / -_|  _/ -_/ _` |
 |___|_||_/__/\__\__,_|_|_\__,_|\__|_\___|_||_|  \___\___|_|_|_| .__|_\___|\__\___\__,_|
                                                               |_|

EOF
