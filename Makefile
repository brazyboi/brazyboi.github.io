.PHONY: all html

all: build build/main.css html

build:
	mkdir build

clean: build
	rm -r build/*.html 

html: 
	./gen-html.sh

build/main.css: build
	ln -sf ../main.css build/main.css
