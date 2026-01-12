#!/bin/bash -eu

DOTFILES_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/KoheiNagura/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

info() {
  printf "\033[32m%s\033[0m\n" "$1"
}

backup_if_exists() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mkdir -p "$BACKUP_DIR"
    cp -r "$target" "$BACKUP_DIR/"
    info "Backed up: $target → $BACKUP_DIR"
  fi
}

# 1. dotfilesリポジトリのクローン
info "STEP 1: Cloning dotfiles repository..."
if [ -d "$DOTFILES_DIR" ]; then
  info "dotfiles directory already exists. Skipping clone."
else
  # gitコマンドがなければインストール (Linuxの場合)
  if [ "$(uname -s)" = 'Linux' ] && ! command -v git &> /dev/null; then
    sudo apt-get update && sudo apt-get install -y git
  fi
  info "Cloning repository from $REPO_URL"
  if ! git clone "$REPO_URL" "$DOTFILES_DIR"; then
    printf "\033[31mERROR: Failed to clone repository\033[0m\n" >&2
    exit 1
  fi
fi

# 2. Homebrewのインストール
info "STEP 2: Installing Homebrew..."
if ! command -v brew &> /dev/null; then
  info "Homebrew not found. Installing..."
  # Homebrewの公式インストールスクリプトを実行
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # OSを判別して、brewコマンドへのパスを通す
  if [ "$(uname -s)" = 'Darwin' ]; then
    # macOS
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ "$(uname -s)" = 'Linux' ]; then
    # Linux
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi

  # インストール成功確認
  if ! command -v brew &> /dev/null; then
    printf "\033[31mERROR: Homebrew installation failed\033[0m\n" >&2
    exit 1
  fi
else
  info "Homebrew is already installed."
fi

# 3. Homebrewパッケージのインストール
info "STEP 3: Installing packages from Brewfile..."
if [ ! -f "$DOTFILES_DIR/.Brewfile" ]; then
  printf "\033[31mERROR: .Brewfile not found at $DOTFILES_DIR/.Brewfile\033[0m\n" >&2
  exit 1
fi
brew bundle --file="$DOTFILES_DIR/.Brewfile"

# 4. シンボリックリンクの作成
info "STEP 4: Creating symbolic links..."

# .zshrc
backup_if_exists "$HOME/.zshrc"
ln -sfn "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
info "Linked .zshrc"

# .zsh directory
backup_if_exists "$HOME/.zsh"
ln -sfn "$DOTFILES_DIR/.zsh" "$HOME/.zsh"
info "Linked .zsh directory"

# sheldon config
# ~/.config ディレクトリがなければ作成
mkdir -p "$HOME/.config"
backup_if_exists "$HOME/.config/sheldon"
ln -sfn "$DOTFILES_DIR/.config/sheldon" "$HOME/.config/sheldon"
info "Linked sheldon config"

# nvim config
backup_if_exists "$HOME/.config/nvim"
ln -sfn "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
info "Linked nvim config"

# tmux config
backup_if_exists "$HOME/.config/tmux"
ln -sfn "$DOTFILES_DIR/.config/tmux" "$HOME/.config/tmux"
info "Linked tmux config"

# .tigrc
backup_if_exists "$HOME/.tigrc"
ln -sfn "$DOTFILES_DIR/.tigrc" "$HOME/.tigrc"
info "Linked .tigrc"

# .gitconfig
backup_if_exists "$HOME/.gitconfig"
ln -sfn "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
info "Linked .gitconfig"
if [ ! -f "$HOME/.gitconfig.local" ]; then
  info "⚠️  Create ~/.gitconfig.local with your [user] name and email"
fi

info "STEP 4: Finalizing shell environment..."

# fzfのキーバインドと補完をインストール
# --all オプションで、上書き確認などをスキップして全てyesで設定
info "Installing fzf key bindings..."
"$(brew --prefix)/opt/fzf/install" --all

# デフォルトシェルをzshに変更
# which zsh でzshのパスを取得し、現在の$SHELLと比較
if [ "$SHELL" != "$(which zsh)" ]; then
  info "Changing default shell to zsh..."
  # chshコマンドでデフォルトシェルを変更
  if chsh -s "$(which zsh)"; then
    info "Default shell has been changed to zsh. Please re-login to apply the changes."
  else
    info "Failed to change default shell. Please try it manually."
  fi
else
  info "Default shell is already zsh."
fi

info "🎉 All setup finished!"
