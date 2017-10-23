#git auto-complete; PS prompt
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

__ruby_ps1 () {
  if [ $(which rvm) ]; then
    echo `~/.rvm/bin/rvm-prompt`
  elif [ $(which rbenv) ]; then
    rbenv_ruby=`rbenv version | sed -e 's/ .*//'`
    echo $rbenv_ruby
  else
    echo ' '
  fi
}
export PS1='\[\e]0;\u@\h: \w\a\]$(echo "#") ${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W \[\033[01;35m\]$(__ruby_ps1) \[\033[01;32m\]$(__git_ps1 "(%s)")\[\033[00m\]\n'

export PATH=~/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

export EDITOR=mvim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Rust
DYLD_LIBRARY_PATH="/usr/local/lib"

# Local API keys
source ~/.apikeys

complete -C aws_completer aws
