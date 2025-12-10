#!/usr/bin/env python3
import os
import re

# Where your Hugo content lives
ROOT = "."
CONTENT_DIR = os.path.join(ROOT, "content")
EXTS = {".md", ".html"}

# Regex to catch shortcode usages like: {{< name arg1 arg2="value">}} or similar
SHORTCODE_RE = re.compile(r'\{\{<\s*([^\s>]+)\s+([^}]+?)\s*>}}')

def is_bad_arg(arg):
    # If argument contains anything other than alphanumerics, hyphen, underscore
    # and isn’t already quoted — flag it.
    arg = arg.strip()
    # skip named params with quotes
    if re.match(r'^[\w-]+=".*"$', arg):  
        return False
    # positional param — check it
    if re.match(r'^[A-Za-z0-9_-]+$', arg):
        return False
    return True

def scan_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        for i, line in enumerate(f, start=1):
            for m in SHORTCODE_RE.finditer(line):
                shortcode = m.group(1)
                params = m.group(2).split()
                for p in params:
                    if is_bad_arg(p):
                        print(f"{path}:{i}: shortcode '{shortcode}' has unquoted/invalid arg: {p}")

def walk():
    for root, dirs, files in os.walk(CONTENT_DIR):
        for fn in files:
            if os.path.splitext(fn)[1] in EXTS:
                scan_file(os.path.join(root, fn))

if __name__ == "__main__":
    walk()
    print("Scan complete. Review flagged shortcode usages above.")