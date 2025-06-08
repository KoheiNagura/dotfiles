# history
setopt hist_ignore_dups      # 重複を記録しない
setopt hist_ignore_all_dups  # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_space     # スペースで始まるコマンド行はヒストリリストから削除
setopt hist_verify           # ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_expand           # 保管時にヒストリを自動的に展開
setopt share_history         # history共有 