import os
import re

def remove_tags_from_file(file_path):
    # Regular expression to match tags starting with #
    tag_pattern = re.compile(r'#[\w\-]+')
    # '#' matches the literal # symbol.
    # '[\w\-]+' matches any sequence of word characters (letters, numbers, underscores) and hyphens (-).

    # Read the content of the file
    with open(file_path, 'r') as file:
        content = file.read()

    # Remove all tags using the regex pattern
    updated_content = re.sub(tag_pattern, '', content)

    # Write the updated content back to the file
    with open(file_path, 'w') as file:
        file.write(updated_content)

remove_tags_from_file("mail.md")
