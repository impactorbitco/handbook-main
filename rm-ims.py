#!/usr/bin/env python3
import os
import re
import yaml

ROOT = "."
CONTENT_DIR = os.path.join(ROOT, "content")
VALID_EXTS = {".md", ".html"}

def slug_to_title(slug):
    # Convert snake-case / kebab-case / spaced-filename to Title Case
    name = os.path.splitext(os.path.basename(slug))[0]
    name = name.replace('-', ' ').replace('_', ' ').strip()
    # Title-case each word
    return ' '.join(word.capitalize() for word in name.split())

def process_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    if not content.startswith("---"):
        # No front-matter --> skip (or could add, but risky)
        return False

    parts = content.split("---", 2)
    if len(parts) < 3:
        return False

    fm_text = parts[1]
    body = parts[2]

    try:
        fm = yaml.safe_load(fm_text) or {}
    except Exception as e:
        print("YAML parse error in", path, e)
        return False

    changed = False

    if 'title' not in fm or not fm.get('title'):
        fm['title'] = slug_to_title(path)
        changed = True

    if 'weight' not in fm:
        # compute default weight based on order in folder (not perfect but better than nothing)
        fm['weight'] = 10  # or any default number, could be improved to increment per sibling
        changed = True

    if changed:
        new_fm = yaml.safe_dump(fm, sort_keys=False).strip().splitlines()
        new_content = "---\n" + "\n".join(new_fm) + "\n---" + body
        with open(path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print("Patched:", path)
        return True
    return False

def walk_content():
    for dirpath, dirs, files in os.walk(CONTENT_DIR):
        for fn in files:
            if os.path.splitext(fn)[1] in VALID_EXTS:
                process_file(os.path.join(dirpath, fn))

if __name__ == "__main__":
    walk_content()
    print("Done patching navigation front‑matter.")