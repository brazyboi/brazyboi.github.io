.PHONY: all html

all: docs docs/main.css html

docs:
	mkdir docs

clean: docs
	rm -r docs/*.html 

html: 
	./gen-html.sh

docs/main.css: docs
	ln -sf ../main.css docs/main.css
