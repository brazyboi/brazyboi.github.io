.PHONY: all html

all: docs docs/main.css html journal

docs:
	mkdir docs

clean: docs
	rm -r docs/*.html 

html: 
	./gen-html.sh

journal: 
	./gen-journal.sh

docs/main.css: docs
	cat ./main.css > docs/main.css
