$path = "index.html"
$content = Get-Content $path
# Fixed line for Special Offer
$content[1107] = "                Special Offer - 40% Off on Every Order"
# Global cleanup for mojibake
$content = $content -replace "â€™", "&rsquo;"
$content = $content -replace "â€”", "&mdash;"
$content = $content -replace "â€¦", "&hellip;"
$content = $content -replace "â€“", "&ndash;"
$content | Set-Content $path -Encoding UTF8
