# ZSHの設定ディレクトリ
ZSHHOME="${HOME}/dotfiles/.zsh"

# 各設定ファイルを読み込む
source ${ZSHHOME}/path.zsh
source ${ZSHHOME}/aliases.zsh
source ${ZSHHOME}/completion.zsh
source ${ZSHHOME}/functions.zsh
source ${ZSHHOME}/history.zsh
source ${ZSHHOME}/prompt.zsh

eval "$(sheldon source)"