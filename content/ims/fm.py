#!/usr/bin/env python3
import os
import re

# Config — adjust as needed
ROOT_DIR = "."          # root of folder tree to scan
INPUT_EXTENSIONS = {".txt"}    # file types to convert
OUTPUT_EXTENSION = ".md"       # extension for output
OVERWRITE = False              # if True, overwrite existing `.md` files
KEEP_INPUT = True              # whether to keep original input files

def slug_to_title(slug):
    name = os.path.splitext(os.path.basename(slug))[0]
    name = name.replace('-', ' ').replace('_', ' ').strip()
    return ' '.join(word.capitalize() for word in name.split())

def parse_block(lines):
    """
    Given lines of a file, returns (metadata_dict, body_lines).
    Expects first non-empty line = title, then subsequent lines with `Key: Value` pairs.
    Everything after a blank line is body.
    """
    meta = {}
    body_start = None

    # strip leading/trailing blank lines
    while lines and not lines[0].strip():
        lines.pop(0)
    if not lines:
        return None, []

    # first line is title
    title = lines[0].strip()
    meta['title'] = title

    # parse metadata until first blank line after key:value lines
    for idx,line in enumerate(lines[1:], start=1):
        if not line.strip():
            body_start = idx + 1
            break
        if ':' in line:
            key, val = line.split(':', 1)
            key = key.strip().lower().replace(' ', '_').replace('?', '')
            meta[key] = val.strip()
        else:
            # not a metadata line — treat as start of body
            body_start = idx
            break

    body = []
    if body_start is not None:
        body = lines[body_start:]
    return meta, body

def make_frontmatter(meta):
    fm = ["---"]
    for k,v in meta.items():
        # quote string values
        v_clean = v.replace('"', '\\"')
        fm.append(f'{k}: "{v_clean}"')
    fm.append("---")
    fm.append("")  # blank line
    return "\n".join(fm)

def process_file(path):
    base, ext = os.path.splitext(path)
    if ext.lower() not in INPUT_EXTENSIONS:
        return
    # read file
    with open(path, 'r', encoding='utf-8') as f:
        lines = f.read().splitlines()

    meta, body = parse_block(lines)
    if meta is None:
        print("Skipping empty or invalid:", path)
        return

    fm = make_frontmatter(meta)
    body_text = "\n".join(body).strip()
    new_content = fm + body_text + "\n"

    out_path = base + OUTPUT_EXTENSION
    if os.path.exists(out_path) and not OVERWRITE:
        print("Skipping (already exists):", out_path)
        return

    with open(out_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print("Converted:", path, "→", out_path)

    if not KEEP_INPUT:
        os.remove(path)

def walk_and_convert():
    for dirpath, dirnames, filenames in os.walk(ROOT_DIR):
        for fn in filenames:
            process_file(os.path.join(dirpath, fn))

if __name__ == "__main__":
    walk_and_convert()
    print("Done converting all raw blocks to Markdown + front‑matter.")