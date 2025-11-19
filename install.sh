mkdir -p ~/.config/backup/
cp -r ~/.config/tmux/ ~/.config/backup/
cp -r ~/.config/fish/ ~/.config/backup/
cp -r ~/.config/i3/ ~/.config/backup/
cp -r ~/.config/i3status/ ~/.config/backup/
cp -r ~/.config/kitty/ ~/.config/backup/
cp -r ~/.config/nvim/ ~/.config/backup/
cp -r ~/.config/rofi/ ~/.config/backup/

rm -rf ~/.config/tmux/
rm -rf ~/.config/fish/
rm -rf ~/.config/i3/
rm -rf ~/.config/i3status
rm -rf ~/.config/kitty/
rm -rf ~/.config/nvim/
rm -rf ~/.config/rofi

ln -srv tmux/ ~/.config/
ln -srv fish/ ~/.config/
ln -srv i3/ ~/.config/
ln -srv i3status/ ~/.config/
ln -srv kitty/ ~/.config/
ln -srv nvim/ ~/.config/
ln -srv rofi/ ~/.config/


