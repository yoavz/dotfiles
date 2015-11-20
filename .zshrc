# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# for homebrew
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/texbin:~/bin:$PATH"

# cuda
export DYLD_LIBRARY_PATH='/usr/local/cuda/lib/'
export DYLD_FALLBACK_LIBRARY_PATH="/usr/local/cuda/lib:$HOME/.pyenv/versions/anaconda-2.0.1/lib:/usr/local/lib:/usr/lib"

# cafe
export PYTHONPATH="/Users/yoav/projects/deepdream/caffe/python:$PYTHONPATH"

# mvn fix
export JAVA_HOME=$(/usr/libexec/java_home)



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arrow"
# ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew vim)

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vi="mvim -v"
alias vim="mvim -v"
alias zshconfig="vim ~/.zshrc"

# Spark for CS 260
export SPARK_HOME="/Users/yoav/school/cs260/project/spark-1.5.2"
alias spark="$SPARK_HOME/bin/spark-submit"

# Z - fast directory navigating
. `brew --prefix`/etc/profile.d/z.sh

# zsh highlighting!
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

# The next line updates PATH for the Google Cloud SDK.
source '/Users/yoav/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/yoav/google-cloud-sdk/completion.zsh.inc'
