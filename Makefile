vim:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	ln ./vimrc ~/.vimrc

git:
	ln ./gitconfig ~/.gitconfig

tmux:
	ln ./tmux.conf ~/.tmux.conf

zsh:
	curl -L http://install.ohmyz.sh | sh
	ln ./zshrc ~/.zshrc
