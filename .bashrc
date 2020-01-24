parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1='\[\e[1;96m\]\W\[\e[1;35m\]$(parse_git_branch)\[\e[0m\]\$ '

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

source /Users/appfolio/worksetup/alias_setup.sh
source /Users/appfolio/.credentials/microsoft.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
