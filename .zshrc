# Created by newuser for 5.9
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt append_history
setopt hist_ignore_dups
setopt share_history


#environment_variables
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx
export EDITOR=nvim
export BROWSER=firefox
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config


#alias
alias mindustry='java -jar /home/kj/Game/Mindustry.jar'
alias fs="fastfetch"
alias typora="typora --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias nv="nvim"
alias vw="cd ~/Documents/vimwiki"


#prompt
autoload -Uz promptinit 
promptinit
prompt fade blue



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
