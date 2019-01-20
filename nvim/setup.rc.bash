NVIM_HOME=$HOME/.config/nvim

if [[ ! -a $NVIM_HOME ]]
then
    ln -s "$DOT"/nvim "$NVIM_HOME"
fi

if [[ ! -a $HOME/.local/share/nvim/site/autoload/plug.vim ]]
then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
