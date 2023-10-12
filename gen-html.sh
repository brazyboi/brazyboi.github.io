find content -print | grep .md | while IFS= read -r MD_PATH; do
	pandoc --template=page.template $MD_PATH > $(echo $MD_PATH | sed 's/content/docs/' - | sed 's/.md/.html/' -)
done
