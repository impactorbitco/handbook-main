#!/usr/bin/env bash

set -e

# Process all Markdown files in current directory
for file in *.md; do
  # Extract filename without extension
  base="${file%.md}"

  # Remove trailing ID (a long hex-like string)
  # Match: space + 16–32 hex chars
  newname="$(echo "$base" | sed -E 's/[[:space:]]+[0-9a-fA-F]{16,32}$//')"

  # Edge case: if name didn't change (e.g. no trailing ID)
  if [[ "$newname" == "$base" ]]; then
    cleanname="$file"
  else
    cleanname="$newname.md"
    echo "Renaming: $file → $cleanname"
    mv "$file" "$cleanname"
  fi

  # Insert title if missing
  # Check whether front matter exists
  if ! grep -q "^title:" "$cleanname"; then
    echo "Adding title to: $cleanname"

    # Create a title from filename (strip .md)
    title="$(basename "$cleanname" .md)"

    # Insert front matter if missing or broken
    if ! grep -q "^---" "$cleanname"; then
      # No front matter — create it
      tmpfile=$(mktemp)
      {
        echo "---"
        echo "title: \"$title\""
        echo "---"
        echo ""
        cat "$cleanname"
      } > "$tmpfile"
      mv "$tmpfile" "$cleanname"

    else
      # Front matter exists, so insert under the header
      tmpfile=$(mktemp)
      awk -v title="$title" '
        BEGIN { inserted=0 }
        /^---$/ && !inserted {
          print
          getline
          if ($0 !~ /^title:/) {
            print "title: \"" title "\""
            print $0
          } else {
            print $0
          }
          inserted=1
          next
        }
        { print }
      ' "$cleanname" > "$tmpfile"
      mv "$tmpfile" "$cleanname"
    fi
  fi

done

echo "Done!"