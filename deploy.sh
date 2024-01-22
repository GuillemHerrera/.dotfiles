#!/bin/bash

# Get the user's home directory
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

# Dotfiles directory
DOTFILES_DIR="$USER_HOME/.dotfiles"

# List of dotfiles to deploy
DOTFILES=("zsh/.zshrc" "bash/.bash_profile" "vim/.vimrc" "git/.gitconfig")

# XKB rules directory
XKB_RULES_DIR="/usr/share/X11/xkb/rules"
EVDEV_XML_FILE="evdev.xml"

# XKB symbols directory
XKB_SYMBOLS_DIR="/usr/share/X11/xkb/symbols"
SCK_FILE="sck"

# Function to install Zsh if not already installed
install_zsh() {
    if ! command -v zsh &> /dev/null; then
        echo "Zsh is not installed. Installing..."
        # Add the installation command based on your system package manager
        # For example, on Debian/Ubuntu-based systems, you can use:
        sudo apt-get update
        sudo apt-get install -y zsh
    else
        echo "Zsh is already installed."
    fi
}

# Function to refresh X11 server
refresh_x11() {
    # Add the command to refresh or restart the X server
    # For example, on systems using the Xorg server, you can use:
    sudo systemctl restart display-manager.service
}

# Function to create backup with timestamp
backup_file() {
    local file="$1"
    if [ -e "$file" ]; then
        local timestamp=$(date +"%Y%m%d_%H%M%S")
        local backup_file="$file.backup_$timestamp"
        sudo cp "$file" "$backup_file" || { echo "Error creating backup for $file"; exit 1; }
        echo "Backup created: $backup_file"
    fi
}

# Deploy dotfiles
for file in "${DOTFILES[@]}"; do
    target_file="$USER_HOME/.$(basename "$file")"
    ln -sf "$DOTFILES_DIR/$file" "$target_file"
done

# Install Zsh
install_zsh

# Backup and deploy evdev.xml
backup_file "$XKB_RULES_DIR/$EVDEV_XML_FILE"
sudo cp "$DOTFILES_DIR/xkb/$EVDEV_XML_FILE" "$XKB_RULES_DIR" || { echo "Error copying $EVDEV_XML_FILE"; exit 1; }

# Backup and deploy sck file
backup_file "$XKB_SYMBOLS_DIR/$SCK_FILE"
sudo cp "$DOTFILES_DIR/xkb/$SCK_FILE" "$XKB_SYMBOLS_DIR" || { echo "Error copying $SCK_FILE"; exit 1; }

# Prompt user to refresh X11
read -p "Do you want to refresh X11 to apply the custom keyboard configuration? (y/n): " choice
if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    refresh_x11
    echo "X11 has been refreshed."
else
    echo "X11 was not refreshed. You may need to manually restart your X server to apply the changes."
fi
