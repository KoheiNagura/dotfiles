# 基本的なキーバインド
bindkey -e

# 入力した内容を消去
bindkey '^U' kill-whole-line

# Mac用対応 Option + Cで実行できるように
bindkey "ç" fzf-cd-widget

# fzfによるファイル検索
zle -N fzf_open
bindkey '^O' fzf_open
