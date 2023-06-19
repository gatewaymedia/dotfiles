# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

oa() {
 open "/Applications/$1.app"
}

alias yta='yt-dlp -i -x -f bestaudio --audio-format "mp3" --audio-quality 0'
alias ytv='yt-dlp -f "bestvideo[ext=mp4][height=1080]+bestaudio[ext=m4a][acodec*=mp4a]" --recode-video "mp4"'

# Set color variables
blueBreaker='\n\033[48;2;0;51;100m\033[38;22;255;255;255m\033[1;37m ==> \033[0m'
bold='\033[1;37m'
reset='\033[0m'

yyyymmdd=$(date '+%Y%m%d')
alias brewcheck='echo "${blueBreaker} ${bold}Cleaning up brewfiles${reset}"; brew cleanup --prune=3; echo "${blueBreaker} ${bold}Checking for updates${reset}"; brew update; echo "${blueBreaker} ${bold}Upgrading casks/formulas automatically${reset}"; brew upgrade; echo "${blueBreaker} ${bold}Checking for outdated App Store applications${reset}"; mas outdated; echo "${blueBreaker} ${bold}The following outdated casks/formulas must be updated manually${reset}"; brew outdated --greedy-auto-updates --verbose;'
alias brewcheckgreedy='echo "${blueBreaker} ${bold}Cleaning up brewfiles${reset}"; brew cleanup --prune=3; echo "${blueBreaker} ${bold}Checking for updates${reset}"; brew update; echo "${blueBreaker} ${bold}Upgrading casks/formulas automatically${reset}"; brew upgrade; echo "${blueBreaker} ${bold}Checking for outdated App Store applications${reset}"; mas outdated; echo "${blueBreaker} ${bold}The following outdated casks/formulas must be updated manually${reset}"; brew outdated --greedy --verbose;'
alias brewupgrade='brew outdated --greedy --verbose | grep -v "(latest)" | sed -E "s|[^A-z0-9-]\(.*\).*||" | xargs brew upgrade'

alias home='cd; clear;'

export HOMEBREW_OPEN_AFTER_INSTALL=1

curlfollow() { curl -sLI "$1" | grep -i Location; }
curlcontent() { curl -sLI "$1" | grep -i content-disposition; }

