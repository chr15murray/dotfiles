# Support Debugging 
# zmodload zsh/zprof


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

# If homebrew curl installed add to PATH
if [ -d "/usr/local/opt/curl/bin" ]; then
    export PATH=/usr/local/opt/curl/bin:$PATH
fi

# Setup Fonts and Icons
# Refernce NerdFont: https://nerdfonts.com/#cheat-sheet
# Reference PowerLevel9K: get_icon_names
#POWERLEVEL9K_MODE='nerdfont-complete'
#export POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf09b'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME='powerlevel10k/powerlevel10k'

# Default Powerlevel prompts
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

### Stock Garuda Settings
# Included for each diff when upgrading

# eval "$(starship init zsh)"
# function set_win_title(){
#     echo -ne "\033]0; $USER@$HOST:${PWD/$HOME/~} \007"
# }
# precmd_functions+=(set_win_title)

## Plugins section: Enable fish style features
# Use syntax highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use autosuggestion
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use history substring search
# source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Use fzf
# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh

# Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh


## Options section
# setopt correct                                                  # Auto correct mistakes
# setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
# setopt nocaseglob                                               # Case insensitive globbing
# setopt rcexpandparam                                            # Array expension with parameters
# setopt nocheckjobs                                              # Don't warn about running processes when exiting
# setopt numericglobsort                                          # Sort filenames numerically when it makes sense
# setopt nobeep                                                   # No beep
# setopt appendhistory                                            # Immediately append history instead of overwriting
# setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
# setopt autocd                                                   # if only directory path is entered, cd there.
# setopt auto_pushd
# setopt pushd_ignore_dups
# setopt pushdminus

# Completion.
# autoload -Uz compinit
# compinit
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
# zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
# zstyle ':completion:*' completer _expand _complete _ignored _approximate
# zstyle ':completion:*' menu select
# zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Speed up completions
# zstyle ':completion:*' accept-exact '*(N)'
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ~/.cache/zcache

# automatically load bash completion functions
# autoload -U +X bashcompinit && bashcompinit

# HISTFILE=~/.zhistory
# HISTSIZE=50000
# SAVEHIST=10000


## Keys
# Use emacs key bindings
# bindkey -e

# [PageUp] - Up a line of history
# if [[ -n "${terminfo[kpp]}" ]]; then
#   bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
#   bindkey -M viins "${terminfo[kpp]}" up-line-or-history
#   bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
# fi
# [PageDown] - Down a line of history
# if [[ -n "${terminfo[knp]}" ]]; then
#   bindkey -M emacs "${terminfo[knp]}" down-line-or-history
#   bindkey -M viins "${terminfo[knp]}" down-line-or-history
#   bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
# fi

# Start typing + [Up-Arrow] - fuzzy find history forward
# if [[ -n "${terminfo[kcuu1]}" ]]; then
#   autoload -U up-line-or-beginning-search
#   zle -N up-line-or-beginning-search

#   bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
#   bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
#   bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
# fi
# Start typing + [Down-Arrow] - fuzzy find history backward
# if [[ -n "${terminfo[kcud1]}" ]]; then
#   autoload -U down-line-or-beginning-search
#   zle -N down-line-or-beginning-search

#   bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
#   bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
#   bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
# fi

# [Home] - Go to beginning of line
# if [[ -n "${terminfo[khome]}" ]]; then
#   bindkey -M emacs "${terminfo[khome]}" beginning-of-line
#   bindkey -M viins "${terminfo[khome]}" beginning-of-line
#   bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
# fi
# [End] - Go to end of line
# if [[ -n "${terminfo[kend]}" ]]; then
#   bindkey -M emacs "${terminfo[kend]}"  end-of-line
#   bindkey -M viins "${terminfo[kend]}"  end-of-line
#   bindkey -M vicmd "${terminfo[kend]}"  end-of-line
# fi

# [Shift-Tab] - move through the completion menu backwards
# if [[ -n "${terminfo[kcbt]}" ]]; then
#   bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
#   bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
#   bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
# fi

# [Backspace] - delete backward
# bindkey -M emacs '^?' backward-delete-char
# bindkey -M viins '^?' backward-delete-char
# bindkey -M vicmd '^?' backward-delete-char
# [Delete] - delete forward
# if [[ -n "${terminfo[kdch1]}" ]]; then
#   bindkey -M emacs "${terminfo[kdch1]}" delete-char
#   bindkey -M viins "${terminfo[kdch1]}" delete-char
#   bindkey -M vicmd "${terminfo[kdch1]}" delete-char
# else
#   bindkey -M emacs "^[[3~" delete-char
#   bindkey -M viins "^[[3~" delete-char
#   bindkey -M vicmd "^[[3~" delete-char

#   bindkey -M emacs "^[3;5~" delete-char
#   bindkey -M viins "^[3;5~" delete-char
#   bindkey -M vicmd "^[3;5~" delete-char
# fi


# Common use
alias aup="pamac upgrade --aur"
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages
alias kf='sudo kubefwd svc'
alias z="zellij"
alias za="~/.config/zellij/zattach.sh"

# Get fastest mirrors 
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist" 
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist" 
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist" 
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist" 

# Help people new to Arch
#alias apt='man pacman'
#alias apt-get='man pacman'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'               # Compare .pacnew & .pacsave files 
alias helpme='cht.sh --shell'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias paru="paru --bottomup"

# Replace yay with paru if installed
# [ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru --bottomup'

# Set your countries like --country France --country Germany -- or more.
alias upd='sudo reflector --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist && sudo pacman -Syu && sudo updatedb'


## Run neofetch
# neofetch

### END Garuda Stock Settings

# Chris's Powerlevel configs
# zsh_terraform_env(){
#     local tfenv=$(printenv TF_CLI_ARGS_plan | cut -d "/" -f2)
#     local color='%F{blue}'
#     [[ $tfenv != "" ]] &&  echo -n "%{$color%}\ue2a6  $tfenv%{%f%}"
# }

# zsh_vault_env(){
#     local vault=$(printenv VAULT_ADDR | cut -d "." -f1 | cut -d "-" -f2)
#     local color='%F{gold}'
#     [[ $vault != "" ]] &&  echo -n "%{$color%}\uf023  $vault%{%f%}"
# }

# zsh_env_mismatch(){
#     local tfenv=$(printenv TF_CLI_ARGS_plan | cut -d "/" -f2)
#     local vault=$(printenv VAULT_ADDR | cut -d "." -f1 | cut -d "-" -f2)
#     local k8s=$(kubectl config current-context)
#     local color='%F{yellow}'
#     # WARN if Terraform and Vault environments don't match
#     [[ $vault != "" && $tfenv != "" ]] && [[ $vault != $tfenv ]] && echo -n "%{$color%}\uf071 environment mismatch%{%f%}"
#     # WARN if kube context doesn't contain tf environment
#     [[ $tfenv != "" ]] && [[ $(echo -n $k8s | grep -q $tfenv) == 1 ]] && echo -n "%{$color%}\uf071 context mismatch%{%f%}"

# }

# zsh_iapproxy(){
#     local httpsproxy=$(printenv https_proxy)
#     local iaptunnelproject=$(ps -A -o command | grep start-iap-tunnel | grep -v grep | cut -d" " -f9 )
#     local color='%F{yellow}'
#     [[ $httpsproxy != "" && $iaptunnelproject != "" ]]  && echo -n "%{$color%}\uf064 $iaptunnelproject %{%f%}"
# }

# zsh_proxyon(){
#     local proxyon=$(printenv CLOUDSDK_ACTIVE_CONFIG_NAME)
#     local vpnstatus=$(scutil --nc status Fetch 2> /dev/null | HEAD -n 1)
#     local color='%F{black}'
#     local icon='f817'
#     [[ $vpnstatus != "Connected" ]] && local color='%F{red}' && local icon='f818'
#     [[ $proxyon != "" ]]  && echo -n "%{$color%}\u$icon $proxyon %{%f%}"
# }


# POWERLEVEL9K_CUSTOM_TFENV="zsh_terraform_env"
# POWERLEVEL9K_CUSTOM_VAULT="zsh_vault_env"
# POWERLEVEL9K_CUSTOM_WARN="zsh_env_mismatch"
# POWERLEVEL9K_CUSTOM_IAPPROXY="zsh_iapproxy"
# POWERLEVEL9K_CUSTOM_PROXYON="zsh_proxyon"

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv kubecontext custom_tfenv custom_vault custom_warn  newline vcs custom_iapproxy custom_proxyon )
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator)

# POWERLEVEL9K_VIRTUALENV_BACKGROUND='cyan'
# POWERLEVEL9K_CUSTOM_VAULT_BACKGROUND='dodgerblue3'
# POWERLEVEL9K_KUBECONTEXT_BACKGROUND='skyblue3'
# POWERLEVEL9K_KUBECONTEXT_FOREGROUND='dodgerblue3'
# POWERLEVEL9K_CUSTOM_WARN_BACKGROUND='steel'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
#  asdf
#  bundler
  git
  kube-ps1
#  zsh-wakatime
  zsh-completions
#  nvm
#  emoji
  zsh-autosuggestions
#  taskwarrior
  docker
#  docker-compose
#  rbenv
#  zsh-syntax-highlighting
  fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-nix-shell/nix-shell.plugin.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


## Chris Config ##
#autoload -U compinit && compinit
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=67"
#source <(stern --completion=zsh)

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

curltime () {curl -w @- -o /dev/null -s "$@" <<'EOF'
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
EOF
}

# Alias
aeroclean () { aerospace list-windows --all --json | jq -r '.[] | select(."window-title"=="") | ."window-id"' | xargs -n1 aerospace close --window-id }
[ $( command -v batcat) ] && alias cat=batcat 
[ $( command -v bat) ] && alias cat=bat
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias k=kubectl
ka () { kubectl "$@" --all-namespaces; }
kcert () {k get secret "$@" -o json | jq -r '.data."tls.crt"' | base64 -d  | openssl x509 -noout -text }
alias kall='kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found'
alias kdbg='kubectl run debug-chrism --rm --restart=Never -it --image=nicolaka/netshoot -- bash'
alias kdbgi='kubectl run debug-chrism --rm --restart=Never -it --image=nicolaka/netshoot --overrides="{\"metadata\": { \"labels\": {\"sidecar.istio.io/inject\": \"true\"}}}" -- bash'
alias kp='https_proxy=127.0.0.1:8888 kubectl'
alias kubensp='https_proxy=127.0.0.1:8888 kubens'
#alias ll='ls -lah'
alias ll='eza -la'
alias lsx='eza'
alias cls=clear
alias gssh='gcloud beta compute ssh --tunnel-through-iap'
alias gssh-proxy='gcloud compute start-iap-tunnel bastion1 8888 --project fetch-ai-management --zone europe-west2-a --local-host-port=localhost:8888'
alias tproxy='cd ~/git/infra-terraform/gcp-management && tinyproxy -d -c tinyproxy.conf'
alias t=terraform
alias tp='terraform plan'
alias ta='terraform apply'
alias tg='blast-radius --serve .'
alias tclear='unset TF_CLI_ARGS_plan && unset TF_CLI_ARGS_apply'
alias ccat='pygmentize -g'
alias ccatl='pygmentize -g -O style=colorful,linenos=1'
alias ccaty='pygmentize -g -l yaml'
alias wkgp='watch -n1 kubectl get pods'
alias paru-bundle='paru -Syu --needed $(cat ~/.config/yadm/scripts/paru | grep -v "#" | grep -v "\-git$" )'
alias paru-bundle-git='paru -Syu --needed $(cat ~/.config/yadm/scripts/paru | grep -v "#" | grep "\-git$" )'
alias paru-bundle-edit='vim ~/.config/yadm/scripts/paru'
alias proxyon='export https_proxy=10.20.30.250:8888 CLOUDSDK_ACTIVE_CONFIG_NAME=mgmtvpn no_proxy=vault-prod.economicagents.com,argo.fetch-ai.com'
alias proxyoff='unset CLOUDSDK_ACTIVE_CONFIG_NAME https_proxy no_proxy'
alias whatsmyip='curl https://ipv4.icanhazip.com'
alias gs='git status'
alias gpr='gh pr create -w'
#alias gpush='git config alias.publish "push -u origin"'
alias cleardnscache='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias vim="nvim"
alias p="pulumi"
alias pp="pulumi preview --diff"
alias pup="pulumi up"
alias pupd="pulumi up --diff"
monkify () { /usr/local/bin/terminal-notifier -title Monkify -message "$@" -appIcon ~/.config/monkey-icon.png }
alias tl='todoist sync; echo -e "📮 \e[31mTodoist\n\e[0m"; todoist list --filter "(overdue | today)"'
alias helm2='brew unlink helm && brew link helm@2 --force && helm version && export HELM_TILLER_STORAGE=configmap'
alias helm3='brew unlink helm@2 && brew link helm && helm version && export HELM_EXPERIMENTAL_OCI=1'
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
azid () { az resource show --ids ${RID} -o json }
alias n='nerdctl --namespace k8s.io '
# GCloud
alias helmlogin='export HELM_EXPERIMENTAL_OCI=1 && gcloud auth application-default print-access-token | helm registry login -u oauth2accesstoken --password-stdin https://europe-docker.pkg.dev' 
# Kitty Aliases
alias histcode="kitty @launch --stdin-source=@screen_scrollback code -"
alias kdiff="kitty +kitten diff"
alias icat="kitty +kitten icat"
# Workaround / Compatibility for SSH from kitty - https://sw.kovidgoyal.net/kitty/faq.html#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-when-sshing-into-a-different-computer
#alias ssh="kitty +kitten ssh"

alias ff="aerospace list-windows --all | fzf --bind 'enter:execute(bash -c \"aerospace focus --window-id {1}\")+abort'"

export EDITOR=nvim

# Arch specific Aliases
if [ -f "/etc/arch-release" ]; then
  alias open='xdg-open'
fi


# Path
#export PATH="$PATH:~/bin"
export PATH="$PATH:${HOME}/google-cloud-sdk/bin"

# History Control
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# NVM Configuration
#export NVM_DIR="$HOME/.nvm"
#export NVM_AUTOLOAD=1
#zstyle ':omz:plugins:nvm' autoload yes
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Set Bat config location
# export BAT_CONFIG_PATH="~/.config/bat/bat.conf"

# Auto completion
#complete -C /Users/chrismurray/bin/terraform terraform
#complete -C /Users/chrismurray/bin/vault vault
#source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
#source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# AWS
export AWS_SDK_LOAD_CONFIG=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]; then . "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
#if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then . "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"; fi

# Use the new gcloud auth plugin - https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Add MySQL to Path
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# Golang
export PATH=$PATH:/usr/local/go/bin:~/go/bin

# Rust
export PATH=$PATH:~/.cargo/bin

# Activate antigen
if [ -f /usr/local/share/antigen/antigen.sh ]; then source /usr/local/share/antigen/antigen.zsh; fi 
if [ -f /usr/share/zsh-antigen/antigen.sh ]; then source /usr/share/zsh-antigen/antigen.zsh; fi 

# Ledger
export OPENSSL_ROOT_DIR=/usr/local/Cellar/openssl/1.0.2r

# Docker
## Enable Buildkit
export DOCKER_BUILDKIT=1

# DIRENV.net
## Slow Timeout to avoid warnings on slow runnig direnv scripts such as those retrieving secrets
export DIRENV_WARN_TIMEOUT=30s
export DIRENV_LOG_FORMAT=""

export PATH="/usr/local/opt/libpq/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export PATH=${HOME}/bin:$PATH

#[[ -e "/Users/chrismurray/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/Users/chrismurray/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
#[[ -s "/etc/grc.zsh" ]] && source /usr/local/etc/grc.zsh


# Rancher Desktop
export PATH="$HOME/.rd/bin:$PATH"

# Settings
export RANGER_LOAD_DEFAULT_RC=FALSE

# Homebrew Overrides
#export PATH="/usr/local/opt/helm@2/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom Completions
#fpath=(~/.config/zsh_completions $fpath)

# Load last to avoid crashes
#autoload -U compinit && compinit
#[ $(command -v stern) ] && source <(stern --completion=zsh)
#[ -f "/usr/local/etc/bash_completion.d/az" ] && source /usr/local/etc/bash_completion.d/az
#[ -f "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc" ] && . "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc"

#source <(kubectl completion zsh)

source ~/.config/.iterm2_shell_integration.zsh
export PATH="/usr/local/sbin:$PATH"

#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/local/bin/vault vault

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin
#. "/Users/chrismurray/.acme.sh/acme.sh.env"
alias devproxy="cloudflared access tcp --hostname k8s.dev.bnkd.dev --url 127.0.0.1:8888"
alias devproxy-start="cloudflared access tcp --hostname k8s.dev.bnkd.dev --url 127.0.0.1:8888 &"
alias devproxy="killall cloudflared"

eval "$(direnv hook zsh)"

# Support Debugging
#zprof

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/chrismurray/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="/Users/chrismurray/.antigravity/antigravity/bin:$PATH"

# bun completions
[ -s "/home/chrismurray/.bun/_bun" ] && source "/home/chrismurray/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
