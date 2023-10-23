# Create output path
OUTPUT="build/journal/index.html"
mkdir -p "${OUTPUT%/*}/"

# Convert .md to .html
find content/journal -print | grep -E \.md | while IFS= read -r md_path; do
	if [ ! $md_path = "content/journal/index.md" ] 
	then 
		build_path=$(echo $md_path | sed 's/content/build/' - | sed 's/\.md/\.html/' -)
		pandoc --template=page.template $md_path -p > $build_path
	fi
done

# Find each list item in writing
HTML="$(find content/journal -print | grep -E \.md | while IFS= read -r md_path; do
	if [ ! $md_path = "content/journal/index.md" ] 
	then 
		URL_PATH=$(echo $md_path | sed 's/content\/journal\///' - | sed 's/\/index//')
		pandoc --template=feed.template --variable path=$URL_PATH --variable date="$(date -d $(yq --front-matter=extract '.date' $md_path) +"%B %-d, %Y")" $md_path
	fi
	done)"

journal_title="Journal"
journal_desc="A place to type out some thoughts."

# Insert list items
echo "<ul class=\"posts\">" $(echo "$HTML" | sort -k 4,4r -k 2,2rM -k 3,3rn) "</ul>" | \
	pandoc --template=page.template --variable pagetitle="$journal_title" --variable desc="$journal_desc" |
	sed 's/.md//' - \
	> $OUTPUT
