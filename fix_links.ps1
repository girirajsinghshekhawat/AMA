
$files = Get-ChildItem -Filter *.html -Recurse

foreach ($file in $files) {
    Write-Host "Processing $($file.FullName)"
    $content = Get-Content $file.FullName -Raw
    
    # 1. Replace exact href="/" with index.html
    $content = $content -replace 'href="/"', 'href="index.html"'
    
    # 2. Replace href="/ followed by text with relative path (removing slash)
    # Using regex to ensure we only target internal paths
    # We want to catch href="/about" but NOT href="//domain.com"
    $content = $content -replace 'href="/(?![/])', 'href="'
    
    # 3. Replace src="/ with relative path
    $content = $content -replace 'src="/(?![/])', 'src="'
    
    Set-Content $file.FullName $content -NoNewline
}
