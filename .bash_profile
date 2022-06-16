DOTFILES_DIR="$HOME/src/dotfiles"
for DOTFILE in "$DOTFILES_DIR"/.{functions,env,prompt}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# auto complete
if [ -d ${HOME}/.bash.completion ]; then
  for file in ${HOME}/.bash.completion/* ; do
    source $file
  done
fi

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$HOME/opt/flutter/bin"
export PATH="$PATH:$HOME/opt/flutter/.pub-cache/bin"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

function workon() {
  source ~/src/.venvs/$1/bin/activate
}

eval "$(rbenv init - bash)"
