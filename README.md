# Installation Guide

Welcome to the installation guide for **Void Install**. Follow the instructions below to set up the necessary dependencies and software.

## Step 1: Clone the Repository

To get started, clone the repository to your local machine:

```bash
git clone --depth=1 https://github.com/amritxyz/void-install.git ~/void-install
```

Once the repository is cloned, run the installation script:

```bash
sh ~/void-install/install.sh
```

## Step 2: Install Dependencies

To compile **Dwm**, **Dmenu**, **St**, **Slstatus**, and **Slock**, you'll need the following libraries. Install them using the package manager:

```bash
sudo xbps-install base-devel harfbuzz-devel libX11-devel libXinerama-devel libXft-devel libXrandr-devel
```

These libraries are essential for building the software from source.

## Step 3: Install Dwm, Dmenu, St, Slstatus, and Slock

You can find the installation instructions for **Dwm**, **Dmenu**, **St**, **Slstatus**, and **Slock** from the official Suckless Software repository:

[Official Suckless Website](https://suckless.org)
[My build of Suckless Softwares](https://github.com/amritxyz/void-dwm)

---

### Additional Tips:
- Make sure you have a working internet connection before starting the installation.
- If you encounter any issues during the installation, check the repository's [Issues section](https://github.com/amritxyz/void-install/issues) for support.

Enjoy your custom Void setup!

---
