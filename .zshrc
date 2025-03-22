# Created by newuser for 5.9
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt append_history
setopt hist_ignore_dups
setopt share_history
autoload -U compinit; compinit

#environment_variables
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx
export EDITOR=nvim
export BROWSER=firefox
export JAVA_HOME=/usr/lib/jvm/java-23-openjdk
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config
export PATH="$HOME/bin:$PATH"



#alias
#git init --separate-git-dir ~/.git-documents
alias mindustry='java -jar /home/kj/Game/Mindustry.jar'
alias fs="fastfetch"
alias typora="typora --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias nv="nvim"
alias vw="cd ~/Documents/vimwiki"
alias cdd="cd ~/Documents"
alias vs="code --ozone-platform-hint=wayland"
alias mc="minecraft-launcher"
alias kb="cd ~/Documents/Blog/King\'s_blog"

#prompt
autoload -Uz promptinit 
promptinit
#prompt fade blu
PROMPT='%F{gray}%f %F{#8c7769}%n%f %F{#2b8cc7} %f %F{#99a785}%~%f %F{#779dc2}❭%f '

#bindkey
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word


#function
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}




# The following lines were added by compinstall
zstyle :compinstall filename '/home/kj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kj/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kj/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kj/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kj/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

