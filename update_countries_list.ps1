$files = Get-ChildItem -Path . -Include *.html -Recurse

$footerCountries = @(
    "UK", "USA", "Australia", "Canada", "UAE", "New Zealand", "Malaysia", "Ireland"
)

$dropdownCountries = @(
    "UK", "USA", "Australia", "Canada", "UAE", "New Zealand", "Malaysia", "Ireland", 
    "Singapore", "Germany", "France", "Italy", "Oman", "Qatar", "Kuwait", "Saudi Arabia"
)

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # 1. Update Footer List
    # Find the Countries We Serve block and replace its <ul> content
    $footerRegex = '(?s)(Countries We Serve<span[^>]*>\+</span>\s*</span>\s*<ul class="list">)(.*?)(</ul>)'
    $newFooterItems = ""
    foreach ($c in $footerCountries) {
        $newFooterItems += "`n                    <li><a href=`"javascript:void(0)`">$c</a></li>"
    }
    $newFooterItems += "`n                    <li><a href=`"javascript:void(0)`">54+ more countries</a></li>`n                  "
    
    $content = $content -replace $footerRegex, "`$1$newFooterItems`$3"

    # 2. Update Navigation Dropdown List
    # Find the country-dropdown block and replace its <ul> content
    $dropdownRegex = '(?s)(<li class="[^"]*country-dropdown">.*?<ul>)(.*?)(</ul>)'
    $newDropdownItems = ""
    foreach ($c in $dropdownCountries) {
        $newDropdownItems += "`n                          <li><a href=`"javascript:void(0)`">$c</a></li>"
    }
    $newDropdownItems += "`n                          <li><a href=`"javascript:void(0)`">54+ more countries</a></li>`n                        "
    
    $content = $content -replace $dropdownRegex, "`$1$newDropdownItems`$3"

    Set-Content $file.FullName $content -NoNewline
}
