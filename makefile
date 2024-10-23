build_mail:
	path=$$(ls Obsidian/Obsidian/*.md | shuf -n 1) && \
	file_name=$$(echo "$$path" | cut -c 19- | rev | cut -c 4- | rev) && \
	echo "This mail stems from the [obsidian_reminder](https://github.com/artainmo/obsidian_reminder) project.\n\n" > mail.md && \
	echo "The obsidian note of the day is titled: '$$file_name'. See its contents below.\n\n" >> mail.md && \
	echo "-----------------------\n" >> mail.md && \
	cat "$$path" >> mail.md && \
	echo "\n\n-----------------------" >> mail.md

update: # update obsidian to have latest notes
	git submodule update --remote # Git knows what to update thanks to the .gitmodules file
	git add .
	git commit -m "Automatically update submodule to latest versions"
	git push

.PHONY: update
