
# Dotfiles

This repository contains my personal dotfiles and configuration files for various tools and applications, including Zsh, Bash, Vim, Git, and custom keyboard configurations for X11.

## Table of Contents

- [Dotfiles Overview](#dotfiles-overview)
- [Installation](#installation)
- [Usage](#usage)
- [Custom Keyboard Configuration](#custom-keyboard-configuration)
- [LunarVim Configuration](#lunarvim-configuration)
- [License](#license)

## Dotfiles Overview

- **Zsh:** Contains my Zsh configuration file (`zsh/.zshrc`).
- **Bash:** Includes my Bash profile configuration (`bash/.bash_profile`).
- **Vim:** Holds my Vim configuration file (`vim/.vimrc`).
- **Git:** Includes my Git configuration file (`git/.gitconfig`).
- **XKB:** Custom XKB configurations for the keyboard (`xkb/evdev.xml` and `xkb/sck`).
- **LunarVim:** Configuration files for LunarVim (`lvim/config.lua` and individual Lua files in `lvim/lua`).

## Installation

To deploy these dotfiles on a new system, follow these steps:

1. Clone the repository:

   ```bash
   git clone <repository_url>
   cd dotfiles
   ```
2. Run the deploy script:

```bash
./deploy.sh

```
This script will create symbolic links for the dotfiles, install Zsh if needed, deploy XKB configurations, and optionally refresh X11.

## Usage

The dotfiles are organized by category (Zsh, Bash, Vim, Git, etc.). Feel free to explore and modify them according to your preferences.
Custom Keyboard Configuration

The xkb directory contains custom configurations for the XKB (X Keyboard Extension). The evdev.xml file defines custom keyboard layouts, and the sck file contains additional symbols.

After deploying the dotfiles, consider refreshing X11 to apply the custom keyboard configuration.


## LunarVim Configuration

If you are using LunarVim, the lvim directory includes configuration files. The config.lua file contains main LunarVim settings, and the lua folder includes additional Lua files for customization.
