# Enable Powerlevel9k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=~/usr/bin:/bin:/usr/sbin:/sbin:$PATH

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# install powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
# install syntax higlighting
zinit light zsh-users/zsh-syntax-highlighting
# install zsh completions
zinit light zsh-users/zsh-completions
# install zsh autosuggestions
zinit light zsh-users/zsh-autosuggestions
# tab fuzzy finding integration
zinit light Aloxaf/fzf-tab

# add snippets
zinit snippet OMZP::git
zinit snippet OMZP::aws
zinit snippet OMZP::azure
zinit snippet OMZP::command-not-found
zinit snippet OMZP::golang
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::jsontools

# load autocompletions
autoload -U compinit && compinit

# used to replay all cached completions
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history persistence
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd*' fzf-preview 'ls --color $realpath'

# For nano improvements
export EDITOR=/usr/local/bin/nano
export VISUAL="$EDITOR"

# aliases
alias ls='ls --color'
alias nvim='cd ~ && cd repos && ./nvim-macos-arm64/bin/nvim'

# shell integrations
eval "$(fzf --zsh)"

# work specific
export LDFLAGS="-L/opt/homebrew/opt/freetds/lib -L/opt/homebrew/opt/openssl@3/lib"
export CFLAGS="-I/opt/homebrew/opt/freetds/include"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"


export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
export PATH="/opt/homebrew/opt/scala@2.12/bin:$PATH"
