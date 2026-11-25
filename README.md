# My dotfiles
Laptop: MacBook Pro (M5 Pro, 48 GB)  
System: macOS 27  

## Software
Shell: Zsh + Zim  
Terminal: Ghostty  
Terminal multiplexer: Tmux  
Agent terminals: Rex, herdr  
Window management: Rectangle  
Text editor: VS Code  
Proxy client: FlClash  
Package manager: Homebrew  
Python: Miniconda, uv  
Local LLM: oMLX  
CLI coding agent: Claude Code, Codex  
personalOS: Obsidian + Claude Code  

My old Arch Linux + Hyprland setup lives on the [arch-linux](https://github.com/Kingjinsight/.config/tree/arch-linux) branch.

## One-command installation
Install [Homebrew](https://brew.sh) first, then:
```shell
git clone https://github.com/Kingjinsight/.config ~/dotfiles && ~/dotfiles/install.sh
```
It symlinks every config here into `$HOME` (anything it replaces goes to `~/.dotfiles-backup`), installs the `Brewfile`, and installs the tmux plugins.
