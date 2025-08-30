# OSごとにHomebrewのパスを設定
if [ "$(uname)" = 'Darwin' ]; then
  export PATH="/opt/homebrew/bin:$PATH"
elif [ "$(uname)" = 'Linux' ]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

# ユーザーコマンド
export PATH="$HOME/commands:$PATH"

# git diff-highlight
export PATH="$(brew --prefix git)/share/git-core/contrib/diff-highlight:$PATH"

# パスの重複を削除
typeset -U PATH path 

# PATHの重複を削除
typeset -U PATH path

# よく使うパスを先頭に
path=(
  /usr/local/bin
  $HOME/bin
  $path
)