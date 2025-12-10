// fix-shortcodes.js
const fs = require('fs');
const path = require('path');

// Use __dirname (location of this script) as base, then go to your project root
const ROOT = path.resolve(__dirname, '..');   // adjust if script is inside root already
const CONTENT_DIR = path.join(ROOT, 'content');

function fixShortcodes(dir) {
  if (!fs.existsSync(dir) || !fs.statSync(dir).isDirectory()) {
    console.warn(`Directory not found: ${dir}`);
    return;
  }

  const entries = fs.readdirSync(dir);
  entries.forEach(name => {
    const full = path.join(dir, name);
    const stat = fs.statSync(full);

    if (stat.isDirectory()) {
      fixShortcodes(full);
    } else if (stat.isFile() && ['.md', '.html'].includes(path.extname(name))) {
      let data = fs.readFileSync(full, 'utf8');
      let updated = data;

      // Fix include shortcodes
      updated = updated.replace(
        /{{%\s*include\s*"([^"]+)"\s*%}}/g,
        '{{< include "$1" />}}'
      );
      updated = updated.replace(
        /{{<\s*include\s*([^\/][^>]*)>}}/g,
        '{{< include $1 />}}'
      );

      // Fix handbook-data-toc shortcode (make it self-closing)
      updated = updated.replace(
        /{{<\s*handbook-data-toc\s*>}}[\s\S]*?{{<\s*\/handbook-data-toc\s*>}}/g,
        '{{< handbook-data-toc />}}'
      );

      if (updated !== data) {
        fs.writeFileSync(full, updated, 'utf8');
        console.log(`Fixed shortcodes in: ${full}`);
      }
    }
  });
}

fixShortcodes(CONTENT_DIR);
console.log('Done processing content folder.');