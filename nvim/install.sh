#echo "Downloading vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#echo "Make nvim look at our ~/.vimrc file"
mkdir -p ~/.config/nvim
cp $DOTFILES/nvim/init.vim ~/.config/nvim/init.vim

