find content -name '*.md' | while IFS= read -r md_path; do
	build_path=$(echo $md_path | sed 's/content/build/' - | sed 's/\.md/\.html/' -)
	folder_path="${build_path%/*}"
	echo $build_path
	mkdir -p $folder_path
	pandoc --template=page.template $md_path -p > $build_path
done
