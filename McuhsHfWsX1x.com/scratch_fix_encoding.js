const fs = require('fs');
const path = 'index.html';
let content = fs.readFileSync(path, 'utf8');

// Fix common mojibake
content = content.replace(/â€™/g, '&rsquo;');
content = content.replace(/â€”/g, '&mdash;');
content = content.replace(/â€¹/g, '&lsaquo;');
content = content.replace(/â€º/g, '&rsaquo;');
content = content.replace(/â€¦/g, '&hellip;');
content = content.replace(/â€“/g, '&ndash;');
content = content.replace(/âœ…/g, '✅');
content = content.replace(/â–¾/g, '&blacktriangledown;');
content = content.replace(/âˆ’/g, '&minus;');
content = content.replace(/â ³/g, '⏳');
content = content.replace(/Â©/g, '&copy;');
content = content.replace(/â€œ/g, '&ldquo;');
content = content.replace(/â€ /g, '&rdquo;');

// Fix the specific "Special Offer" mangled line
content = content.replace(/.*Special Offer.*40% Off.*/, '                Special Offer - 40% Off on Every Order');

// Fix the mangled flag in the phone button
content = content.replace(/<span class="cc-flag" id="ccFlag">ðŸ‡¬ðŸ‡§<\/span>/, '<span class="cc-flag" id="ccFlag">🇬🇧</span>');

fs.writeFileSync(path, content, 'utf8');
console.log('Fixed encoding in index.html');
