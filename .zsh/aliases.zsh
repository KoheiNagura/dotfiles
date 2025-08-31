# ファイル操作関連
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# ls関連
alias ls='eza -F --icons --group-directories-first'
alias ll='eza -alF --icons --group-directories-first --git'

# ディレクトリ移動
alias ..='cd ..'
alias ...='cd ../..'

# grep関連
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# その他
alias vi='nvim'
alias cl='clear'
alias cc='claude'

# 基本的なエイリアス
alias ~='. cd_home' 
