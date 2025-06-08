# プロンプト設定
autoload -Uz colors && colors
export CLICOLOR=1

# zsh-git-prompt
source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh
alias python="python3"

function prompt::git_info() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
    echo -e "$(git_super_status)"
  fi
}

function prompt::username() {
  echo "%F{cyan}@%n%f"
}

function prompt::directory() {
  echo "%F{yellow}%~%f"
}

function prompt::time() {
  echo "%F{242}%T%f"
}

function prompt::main() {
  local user=$(prompt::username)
  local dir=$(prompt::directory)
  local git=$(prompt::git_info)
  echo -e "\n${user} ${dir} ${git}\n> "
}

precmd() {
  PROMPT=$(prompt::main)
  RPROMPT=$(prompt::time)
}
