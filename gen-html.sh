# Basic pages (everything not journal)
find content -print | grep -E \.md | while IFS= read -r md_path; do
	build_path=$(echo $md_path | sed 's/content/build/' - | sed 's/\.md/\.html/' -)
	if [[ $build_path != *"journal"* ]]; then
		pandoc --template=page.template $md_path -p > $build_path
	fi
done


