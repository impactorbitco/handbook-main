import os
import re

CONTENT_DIR = "./content"

# Pattern matches Hugo shortcodes in the form:
# {{< something params... >}}, {{< /something >}}, {{< something />}}
SHORTCODE_PATTERN = re.compile(r'\{\{<\s*/?[^\s>]+(?:\s+[^>]*)?/?\s*>\}\}')

def clean_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        text = f.read()

    cleaned = SHORTCODE_PATTERN.sub('', text)

    # Optionally collapse multiple blank lines
    cleaned = re.sub(r'\n{3,}', '\n\n', cleaned)

    with open(path, 'w', encoding='utf-8') as f:
        f.write(cleaned)
    print("Cleaned:", path)

def walk(dirpath):
    for root, dirs, files in os.walk(dirpath):
        for fn in files:
            if fn.endswith(('.md', '.html')):
                clean_file(os.path.join(root, fn))

if __name__ == "__main__":
    walk(CONTENT_DIR)
    print("All content cleaned of Hugo shortcodes.")