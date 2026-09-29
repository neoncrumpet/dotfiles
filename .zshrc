export ZSH=/Users/deepfried/.oh-my-zsh

ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf z)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ANDROID_HOME=/usr/local/opt/android-sdk

source $ZSH/oh-my-zsh.sh
source ~/.functions
source ~/.ffmpeg
source ~/.aliases
source ~/.exports
. /usr/local/opt/asdf/libexec/asdf.sh
