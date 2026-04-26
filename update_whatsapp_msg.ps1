$files = Get-ChildItem -Path . -Filter *.html -Recurse

$oldLink = "https://wa.me/918107057573"
$newLink = "https://wa.me/918107057573?text=hi%20i%20visisted%20your%20website%20(acemeassignment.com).%20i%20am%20intrested%20in%20your%20services."

foreach ($file in $files) {
    Write-Host "Processing $($file.FullName)..."
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    if ($content.Contains($oldLink)) {
        $content = $content.Replace($oldLink, $newLink)
        $content | Set-Content -Path $file.FullName -Encoding UTF8
        Write-Host "  Updated WhatsApp links."
    }
}

Write-Host "Done!"
