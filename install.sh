#!/usr/bin/env bash
set -euo pipefail

CONFIGS=(
  tmux
  fish
  i3
  i3status
  kitty
  nvim
  rofi
)

HOME_FILES=(
  bashrc
  fzf.bash
)

CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$CONFIG_DIR/backup-$(date +%Y%m%d-%H%M%S)"

echo "Creating backup directory at: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

echo "Backing up existing ~/.config directories..."
for cfg in "${CONFIGS[@]}"; do
  TARGET="$CONFIG_DIR/$cfg"
  if [ -d "$TARGET" ] || [ -L "$TARGET" ]; then
    echo "  → $cfg"
    mv "$TARGET" "$BACKUP_DIR/"
  fi
done

echo "Linking ~/.config directories..."
for cfg in "${CONFIGS[@]}"; do
  if [ -d "$cfg" ]; then
    ln -snfv "$(pwd)/$cfg" "$CONFIG_DIR/"
  else
    echo "Warning: $cfg directory not found, skipping."
  fi
done

echo "Installed all config directories"
echo "Installing home configs..."

echo "Backing up home dotfiles..."
for file in "${HOME_FILES[@]}"; do
  TARGET="$HOME/.${file}"
  if [ -f "$TARGET" ] || [ -L "$TARGET" ]; then
    echo "  → .$file"
    mv "$TARGET" "$BACKUP_DIR/"
  fi
done

echo "Linking home dotfiles..."
for file in "${HOME_FILES[@]}"; do
  if [ -f "$file" ]; then
    ln -snfv "$(pwd)/$file" "$HOME/.${file}"
  else
    echo "Warning: $file not found in repo, skipping."
  fi
done

echo "Install complete."
echo "Backup stored in: $BACKUP_DIR"

