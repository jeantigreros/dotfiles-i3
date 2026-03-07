#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$CONFIG_DIR/backup-$TIMESTAMP"

CONFIGS=(
  tmux
  fish
  i3
  i3status
  kitty
  nvim
  mpv
  foot
  rofi
)

HOME_FILES=(
  bashrc
  fzf.bash
)

backup=false

echo "First time installing this dotfiles?"
read -r -p "[y/N] " response
response=${response,,}

if [[ "$response" =~ ^(y|yes)$ ]]; then
  backup=true
  mkdir -p "$BACKUP_DIR"
  echo "Backup directory created: $BACKUP_DIR"
fi

link_file () {
  src="$1"
  dest="$2"

  if [[ -e "$dest" || -L "$dest" ]]; then
    if [[ "$backup" == true ]]; then
      echo "Backing up $dest"
      mv "$dest" "$BACKUP_DIR/"
    fi
  fi

  echo "Linking $dest → $src"
  ln -snfvT "$src" "$dest"
}

echo
echo "Linking config directories..."

for cfg in "${CONFIGS[@]}"; do
  src="$DOTFILES_DIR/$cfg"
  dest="$CONFIG_DIR/$cfg"

  if [[ -d "$src" ]]; then
    mkdir -p "$CONFIG_DIR"
    link_file "$src" "$dest"
  else
    echo "Skipping missing config: $cfg"
  fi
done

echo
echo "Linking home dotfiles..."

for file in "${HOME_FILES[@]}"; do
  src="$DOTFILES_DIR/$file"
  dest="$HOME/.${file}"

  if [[ -f "$src" ]]; then
    link_file "$src" "$dest"
  else
    echo "Skipping missing file: $file"
  fi
done

echo
echo "Dotfiles installation complete."

if [[ "$backup" == true ]]; then
  echo "Backup saved at: $BACKUP_DIR"
fi
