# ZSHの設定ディレクトリ
ZSHHOME="${HOME}/dotfiles/.zsh"

# 各設定ファイルを読み込む
source ${ZSHHOME}/path.zsh
source ${ZSHHOME}/aliases.zsh
source ${ZSHHOME}/completion.zsh
source ${ZSHHOME}/functions.zsh
source ${ZSHHOME}/history.zsh
source ${ZSHHOME}/prompt.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_COMMAND='fd --hidden'

eval "$(sheldon source)"
