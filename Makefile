install:
	git submodule init
	git submodule update
	ln -s $$HOME/.vim/.vimrc $$HOME/.vimrc
clean:
	rm $$HOME/.vimrc
