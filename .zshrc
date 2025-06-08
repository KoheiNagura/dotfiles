# ZSHの設定ディレクトリ
ZSHHOME="${HOME}/dotfiles/.zsh"

# 各設定ファイルを読み込む
if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
  for file in ${ZSHHOME}/*.zsh; do
    if [ -f $file -a -r $file ]; then
        source $file
    fi
  done
fi
