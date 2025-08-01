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
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# omz quiet updates
zstyle ':omz:update' verbose minimal # only few lines

# omz disable auto updates
zstyle ':omz:update' mode disabled

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

quiet_which() {
  command -v "$1" >/dev/null
}

oa() {
  for app in "$@"; do
    open /Applications/"$app".app
  done
}

if quiet_which yt-dlp
then
 alias yta='yt-dlp -i -x -f bestaudio --audio-format "mp3" --audio-quality 0'
 alias ytv='yt-dlp --recode-video "mp4"'
fi

# Set color variables
blueBreaker='\n\033[48;2;0;51;100m\033[38;22;255;255;255m\033[1;37m ==> \033[0m'
bold='\033[1;37m'
reset='\033[0m'

yyyymmdd=$(date '+%Y%m%d')
alias brewcheck='echo "${blueBreaker} ${bold}Cleaning up brewfiles${reset}"; brew cleanup --prune=3; echo "${blueBreaker} ${bold}Updating Oh My Zsh${reset}"; $ZSH/tools/upgrade.sh -v minimal; echo "${blueBreaker} ${bold}Running brew autoremove${reset}"; brew autoremove; echo "${blueBreaker} ${bold}Checking for updates${reset}"; brew update; echo "${blueBreaker} ${bold}Checking Brewfile${reset}"; brew bundle install --global; echo "${blueBreaker} ${bold}Upgrading casks/formulas automatically${reset}"; bupoutdated; echo "${blueBreaker} ${bold}Checking for outdated App Store applications${reset}"; mas outdated; echo "${blueBreaker} ${bold}The following outdated casks/formulas must be updated manually${reset}"; brew outdated --greedy-auto-updates --verbose;'
alias brewcheckgreedy='echo "${blueBreaker} ${bold}Cleaning up brewfiles${reset}"; brew cleanup --prune=3; echo "${blueBreaker} ${bold}Running brew autoremove${reset}"; brew autoremove; echo "${blueBreaker} ${bold}Checking for updates${reset}"; brew update; echo "${blueBreaker} ${bold}Upgrading casks/formulas automatically${reset}"; bupoutdated; echo "${blueBreaker} ${bold}Checking for outdated App Store applications${reset}"; mas outdated; echo "${blueBreaker} ${bold}The following outdated casks/formulas must be updated manually${reset}"; brew outdated --greedy --verbose;'
alias brewupgrade='brew outdated --greedy --verbose | grep -v "(latest)" | sed -E "s|[^A-z0-9-]\(.*\).*||" | xargs brew upgrade'

alias home='cd; clear;'

export HOMEBREW_OPEN_AFTER_INSTALL=1
export HOMEBREW_INSTALL_BADGE=🤖
export HOMEBREW_DOWNLOAD_CONCURRENCY=8

curlfollow() { curl -sLI "$1" | grep -i Location; }
curlcontent() { curl -sLI "$1" | grep -i content-disposition; }

function cleanup_old_formulae() {
  # Check if the first argument is "--debug"
  debug_mode=false
  if [ "$1" = "--debug" ]; then
    debug_mode=true
  fi

  # List installed brew formulas
  installed_formulae=$(brew ls --formula)

  # Check if none of the required formulas are installed and exit early if so
  if ! echo "$installed_formulae" | grep -q -e "yt-dlp" -e "mas" -e "ffmpeg"; then
    if [ "$debug_mode" = true ]; then
      echo "None of yt-dlp, mas, or ffmpeg are installed. Exiting."
    fi
    return
  fi

  # Get macOS version
  macos_version=$(sw_vers -productVersion)
  
  # Extract the major version and minor version
  major_version=$(echo "$macos_version" | cut -d '.' -f 1)
  
  # Check if macOS version is Monterey (12.x) or older
  if [ "$major_version" -eq 12 ] || [ "$major_version" -lt 12 ]; then
    echo "Running on macOS Monterey or older: $macos_version"
    
    # List installed brew formulas
    installed_formulae=$(brew ls --formula)

    # Uninstall yt-dlp if installed
    if echo "$installed_formulae" | grep -q "yt-dlp"; then
      echo "yt-dlp is installed. Uninstalling..."
      brew uninstall yt-dlp
    fi

    # Uninstall mas if installed
    if echo "$installed_formulae" | grep -q "mas"; then
      echo "mas is installed. Uninstalling..."
      brew uninstall mas
    fi

    # Uninstall ffmpeg if installed
    if echo "$installed_formulae" | grep -q "ffmpeg"; then
      echo "ffmpeg is installed. Uninstalling..."
      brew uninstall ffmpeg
    fi
  else
  # Only print the version message if debug mode is enabled
    if [ "$debug_mode" = true ]; then
      echo "Not running on macOS Ventura or older. Current version: $macos_version"
    fi
  fi
}

bup() {
 
  # If no casks are provided, print a usage message
  if [[ $# -eq 0 ]]; then
    echo "Usage: bup input1 input2 ..."
    return 1
  fi
  
  # Fetch with specified concurrency
  brew fetch "$@"
  
  # Upgrade the provided casks
  echo "Upgrading: $@"
  brew upgrade "$@"
}

bupall() {
  # Check if jq is installed
  if ! command -v jq > /dev/null 2>&1; then
    echo "Error: jq is not installed. Please install jq to proceed."
    return 1
  fi

  # Default concurrency level
  local except_list=()

  # Check for --except flag and capture the arguments
  while [[ $# -gt 0 ]]; do
    case $1 in
      --except)
        shift
        while [[ $# -gt 0 && $1 != --* ]]; do
          except_list+=("$1")
          shift
        done
        ;;
      *)
        break
        ;;
    esac
  done

  # Get the list of outdated casks in JSON format and extract the names using jq
  local outdated_casks
  outdated_casks=($(brew outdated --cask --greedy-auto-updates --json | jq -r '.casks[].name'))

  # Filter out the casks in the except list
  for except in "${except_list[@]}"; do
    outdated_casks=("${outdated_casks[@]/$except}")
  done

  outdated_casks=($(echo "${outdated_casks[@]}" | tr ' ' '\n' | grep -v '^$'))

  # Check if there are no outdated casks
  if [[ ${#outdated_casks[@]} -eq 0 ]]; then
    echo "No outdated casks found."
    return 0
  fi

  # Run the bup function with the concurrency and pass the outdated casks as separate arguments
  echo "Running bup with outdated casks: ${outdated_casks[@]}"
  bup "${outdated_casks[@]}"
}

bupoutdated() {
  # Check if jq is installed
  if ! command -v jq > /dev/null 2>&1; then
    echo "Error: jq is not installed. Please install jq to proceed."
    return 1
  fi

  # Get the list of outdated casks in JSON format and extract the names using jq
  local outdated_casks
  local outdated_formulae
  outdated_casks=($(brew outdated --json | jq -r '.casks[].name'))
  outdated_formulae=($(brew outdated --json | jq -r '.formulae[].name'))

  # join the arrays into a single array
  outdated=("${outdated_casks[@]}" "${outdated_formulae[@]}")

  # Check if there are no outdated casks
  if [[ ${#outdated[@]} -eq 0 ]]; then
    echo "No outdated packages found."
    return 0
  fi

  # Run the bup function with the concurrency and pass the outdated casks as separate arguments
  echo "Running bup with outdated packages: ${outdated[@]}"
  bup "${outdated[@]}"
}

export PATH="/usr/local/sbin:$PATH"

if [ -d "/opt/workbrew" ]; then
  eval $(/opt/workbrew/bin/brew shellenv)
fi