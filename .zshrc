# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Setup Fonts and Icons
# Refernce NerdFont: https://nerdfonts.com/#cheat-sheet
# Reference PowerLevel9K: get_icon_names
POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf09b'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME='powerlevel10k/powerlevel10k'

# Default Powerlevel prompts
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)


# Chris's Powerlevel configs
zsh_terraform_env(){
    local tfenv=$(printenv TF_CLI_ARGS_plan | cut -d "/" -f2)
    local color='%F{blue}'
    [[ $tfenv != "" ]] &&  echo -n "%{$color%}\ue2a6  $tfenv%{%f%}"
}

zsh_vault_env(){
    local vault=$(printenv VAULT_ADDR | cut -d "." -f1 | cut -d "-" -f2)
    local color='%F{gold}'
    [[ $vault != "" ]] &&  echo -n "%{$color%}\uf023  $vault%{%f%}"
}

zsh_env_mismatch(){
    local tfenv=$(printenv TF_CLI_ARGS_plan | cut -d "/" -f2)
    local vault=$(printenv VAULT_ADDR | cut -d "." -f1 | cut -d "-" -f2)
    local k8s=$(kubectl config current-context)
    local color='%F{yellow}'
    # WARN if Terraform and Vault environments don't match
    [[ $vault != "" && $tfenv != "" ]] && [[ $vault != $tfenv ]] && echo -n "%{$color%}\uf071 environment mismatch%{%f%}"
    # WARN if kube context doesn't contain tf environment
    [[ $tfenv != "" ]] && [[ $(echo -n $k8s | grep -q $tfenv) == 1 ]] && echo -n "%{$color%}\uf071 context mismatch%{%f%}"

}

zsh_iapproxy(){
    local httpsproxy=$(printenv https_proxy)
    local iaptunnelproject=$(ps -A -o command | grep start-iap-tunnel | grep -v grep | cut -d" " -f9 )
    local color='%F{yellow}'
    [[ $httpsproxy != "" && $iaptunnelproject != "" ]]  && echo -n "%{$color%}\uf064 $iaptunnelproject %{%f%}"
}

zsh_proxyon(){
    local proxyon=$(printenv CLOUDSDK_ACTIVE_CONFIG_NAME)
    local vpnstatus=$(scutil --nc status Fetch 2> /dev/null | HEAD -n 1)
    local color='%F{black}'
    local icon='f817'
    [[ $vpnstatus != "Connected" ]] && local color='%F{red}' && local icon='f818'
    [[ $proxyon != "" ]]  && echo -n "%{$color%}\u$icon $proxyon %{%f%}"
}


POWERLEVEL9K_CUSTOM_TFENV="zsh_terraform_env"
POWERLEVEL9K_CUSTOM_VAULT="zsh_vault_env"
POWERLEVEL9K_CUSTOM_WARN="zsh_env_mismatch"
POWERLEVEL9K_CUSTOM_IAPPROXY="zsh_iapproxy"
POWERLEVEL9K_CUSTOM_PROXYON="zsh_proxyon"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv kubecontext custom_tfenv custom_vault custom_warn  newline vcs custom_iapproxy custom_proxyon )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator)

POWERLEVEL9K_VIRTUALENV_BACKGROUND='cyan'
POWERLEVEL9K_CUSTOM_VAULT_BACKGROUND='dodgerblue3'
POWERLEVEL9K_KUBECONTEXT_BACKGROUND='skyblue3'
POWERLEVEL9K_KUBECONTEXT_FOREGROUND='dodgerblue3'
POWERLEVEL9K_CUSTOM_WARN_BACKGROUND='steel'

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

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  kube-ps1
  zsh-wakatime
  zsh-completions
  emoji
  zsh-autosuggestions
  taskwarrior
)

source $ZSH/oh-my-zsh.sh

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
[ $( command -v batcat) ] && alias cat=batcat 
[ $( command -v bat) ] && alias cat=bat
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias k=kubectl
ka () { kubectl "$@" --all-namespaces; }
alias kp='https_proxy=127.0.0.1:8888 kubectl'
alias kubensp='https_proxy=127.0.0.1:8888 kubens'
#alias ll='ls -lah'
alias ll='exa -la'
alias lsx='exa'
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
alias jsre="jira jql \"(project = OPS OR labels = RequireSRE ) AND (status != Done AND status != Rejected AND status != 'Waiting for Triage' AND status != Completed ) \""
#alias tl='echo -e "🔷 \e[34mJira\e[0m" ; jsre; echo -e "✅ \e[32mThings\n\e[0m"; things.sh all'
alias tl='echo -e "🔷 \e[34mJira\e[0m" ; jsre; todoist sync; echo -e "📮 \e[31mTodoist\n\e[0m"; todoist list --filter "(overdue | today)"'
alias helm2='brew unlink helm && brew link helm@2 --force && helm version && export HELM_TILLER_STORAGE=configmap'
alias helm3='brew unlink helm@2 && brew link helm && helm version && export HELM_EXPERIMENTAL_OCI=1'
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
azid () { az resource show --ids ${RID} -o json }
# Kitty Aliases
alias kdiff="kitty +kitten diff"
alias icat="kitty +kitten icat"
# Workaround / Compatibility for SSH from kitty - https://sw.kovidgoyal.net/kitty/faq.html#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-when-sshing-into-a-different-computer
alias ssh="kitty +kitten ssh"


# Path
#export PATH="$PATH:~/bin"
export PATH="$PATH:${HOME}/google-cloud-sdk/bin"

# History Control
export HISTCONTROL=ignoreboth

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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
if [ -f "${HOME}/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# Add MySQL to Path
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# source ~/keys/terraform.rc

# Activate antigen
if [ -f /usr/local/share/antigen/antigen.sh ]; then source /usr/local/share/antigen/antigen.zsh; fi 
if [ -f /usr/share/zsh-antigen/antigen.sh ]; then source /usr/share/zsh-antigen/antigen.zsh; fi 

# Ledger
export OPENSSL_ROOT_DIR=/usr/local/Cellar/openssl/1.0.2r

# Docker
## Enable Buildkit
export DOCKER_BUILDKIT=1


export PATH="/usr/local/opt/libpq/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export PATH=${HOME}/bin:$PATH

#[[ -e "/Users/chrismurray/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/Users/chrismurray/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
#[[ -s "/etc/grc.zsh" ]] && source /usr/local/etc/grc.zsh

# Settings
export RANGER_LOAD_DEFAULT_RC=FALSE

# Homebrew Overrides
#export PATH="/usr/local/opt/helm@2/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom Completions
fpath=(~/.config/zsh_completions $fpath)

# Load last to avoid crashes
autoload -U compinit && compinit
[ $(command -v stern) ] && source <(stern --completion=zsh)
[ -f "/usr/local/etc/bash_completion.d/az" ] && source /usr/local/etc/bash_completion.d/az
[ -f "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc" ] && . "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc"

source ~/.config/.iterm2_shell_integration.zsh
export PATH="/usr/local/sbin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
