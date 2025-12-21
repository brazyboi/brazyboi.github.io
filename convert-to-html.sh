#!/bin/bash

OUTPUT_DIR="public"
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

cp -r assets "$OUTPUT_DIR/" 2>/dev/null

find . -name "*.md" | while read -r filepath; do
	cleaned_filepath="${filepath#./}"
	html_path="$OUTPUT_DIR/${cleaned_filepath%.md}.html"	
	mkdir -p "$(dirname "$html_path")"
	pandoc "$filepath" -o "$html_path" -s --template=template.html 
done
