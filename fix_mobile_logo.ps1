$files = Get-ChildItem -Path . -Include *.html -Recurse

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Update the nav-logo style to give it more space and better centering
    $content = $content -replace '<div class="nav-logo" style="height: 80px; text-align: center;">', '<div class="nav-logo" style="padding: 20px 0; text-align: center;">'
    
    # Also check if it's slightly different in some files
    $content = $content -replace '<div class="nav-logo" style="height: 80px;text-align: center;">', '<div class="nav-logo" style="padding: 20px 0; text-align: center;">'

    Set-Content $file.FullName $content -NoNewline
}
