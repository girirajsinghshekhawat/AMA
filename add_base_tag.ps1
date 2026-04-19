
$files = Get-ChildItem -Filter *.html -Recurse

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Check if <base> already exists
    if ($content -notmatch '<base href="/AMA/">') {
        # Insert <base> right after <head>
        $content = $content -replace '<head>', "<head>`n    <base href=""/AMA/"">"
        Set-Content $file.FullName $content -NoNewline
        Write-Host "Added <base> to $($file.Name)"
    }
}
