# Homebrewのパス
export PATH="/opt/homebrew/bin:$PATH"

# ユーザーコマンド
export PATH="$HOME/commands:$PATH"

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