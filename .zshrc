# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jean/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""
DEFAULT_USER="jean"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  screen
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

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
# Aliases
alias trc="python -m serial.tools.miniterm --filter direct -e"
alias gtkterm="sudo -b gtkterm"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.vim/plugged/fzf/shell/key-bindings.zsh
source ~/.vim/plugged/fzf/shell/completion.zsh

# Prevent environment variable concatenation from tmux
if [[ -z $TMUX ]]; then
    # Edit PATH
    export PATH="$PATH:/sbin"

    # Qt 5.15.2
    export PATH="$PATH:/usr/local/Qt-5.15.2/bin"
    # QtCreator
    #export PATH="$PATH:/home/jean/QtCreator/Tools/QtCreator/bin"

    # OpenJDK
    #export JAVA_HOME="/usr/local/jdk-14"
    #export PATH="$PATH:$JAVA_HOME/bin"
    # Android SDK tools
    #export ANDROID_HOME="/home/jean/android"
    #export PATH="$PATH:$ANDROID_HOME/platform-tools"
    #export PATH="$PATH:$ANDROID_HOME/tools"
    ## Android NDK
    #export ANDROID_NDK_HOME="$ANDROID_HOME/ndk-bundle"
    # Add local openssl
    #export PATH="/usr/local/opt/openssl/bin:$PATH"

    # Sonar Scanner
    #export PATH="$PATH:/home/jean/Desktop/sonar-scanner/bin"

    # Edit PKG_CONFIG_PATH
    # Add openssl and libpcap pkg-config
    export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig"
    export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/libpcap/lib/pkgconfig"
    export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig"

    # Add libpcap flags for compilation
    export LDFLAGS="-L/usr/local/opt/libpcap/lib"
    export CPPFLAGS="-I/usr/local/opt/libpcap/include"

    # Edit LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"
    # LibXCB
    #export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/Qt-5.15.2/lib"
    #export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/lib/x86_64-linux-gnu"

    # vim as default editor
    export VISUAL=vim
    export EDITOR="$VISUAL"

    # set emsdk environment variables (Qt WebAssembly)
    #source /home/jean/emsdk/emsdk_env.sh 2>&1 >/dev/null
    # set FBX SDK environment variables (Qt 3D Studio)
    #export FBXSDK=$HOME/FBX
fi
export LD_LIBRARY_PATH="/usr/local/lib"

# set language environment variables
LC_CTYPE=fr_FR.UTF-8
LC_ALL=fr_FR.UTF-8

[[ $TERM != "screen" ]] && exec tmux
