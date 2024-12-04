build_mail:
	path=$$(ls Obsidian/Obsidian/*.md | shuf -n 1) && \
	file_name=$$(echo "$$path" | cut -c 19- | rev | cut -c 4- | rev) && \
	echo "This mail stems from the [obsidian_reminder](https://github.com/artainmo/obsidian_reminder) project.\n\n" > obsidian-html/mail.md && \
	echo "The obsidian note of the day is titled: '$$file_name'. See its contents below.\n\n" >> obsidian-html/mail.md && \
	echo "-----------------------" >> obsidian-html/mail.md && \
	cat "$$path" >> obsidian-html/mail.md && \
	echo "\n\n-----------------------" >> obsidian-html/mail.md
	cd obsidian-html && python3 remove_tags.py
	cp -R Obsidian/Obsidian/.obsidian obsidian-html
	cd obsidian-html && python3 -m obsidianhtml convert -i config.yml
	tail -n +5 obsidian-html/output/md/index.md > mail.md # Omit metadata and copy to root
	cd obsidian-html && rm -rf .obsidian mail.md output

update: # update obsidian to have latest notes
	git submodule update --remote # Git knows what to update thanks to the .gitmodules file
	git add .
	git commit -m "Automatically update submodule to latest versions"
	git push

.PHONY: update build_mail
