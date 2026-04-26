$files = Get-ChildItem -Path . -Filter *.html -Recurse

foreach ($file in $files) {
    Write-Host "Processing $($file.FullName)..."
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    # 1. JSON-LD Telephone (both with and without space)
    $content = $content -replace '"telephone": "\+91 8107057573"', '"telephone": "+91 9509818171"'
    $content = $content -replace '"telephone": "\+918107057573"', '"telephone": "+91 9509818171"'
    
    # 2. Top Bar (adding calling number if only WhatsApp is present)
    # Using a more flexible regex for whitespace
    $oldTopBarRegex = '(?s)<div class="contact-item">\s*<a href="https://wa\.me/918107057573" target="_blank" class="contact-link">\s*<i class="fa fa-whatsapp"></i>\s*<span class="contact-text">\+91 8107057573</span>\s*</a>'
    $newTopBar = '<div class="contact-item">
            <a href="tel:+919509818171" class="contact-link">
              <i class="fa fa-phone"></i>
              <span class="contact-text">+91 9509818171</span>
            </a>
            <span class="divider">|</span>
            <a href="https://wa.me/918107057573" target="_blank" class="contact-link">
              <i class="fa fa-whatsapp"></i>
              <span class="contact-text">+91 8107057573</span>
            </a>'
    
    if ($content -match $oldTopBarRegex) {
        $content = $content -replace $oldTopBarRegex, $newTopBar
        Write-Host "  Updated Top Bar"
    }

    # 3. Footer Contact Info
    # Replace the phone li
    $oldPhoneLiRegex = '(?s)<li>\s*<i class="fa fa-phone"></i>\s*<a href="tel:\+918107057573">\s*\+91 8107057573</a>\s*</li>'
    $newPhoneLi = '<li>
                          <i class="fa fa-phone"></i>
                          <a href="tel:+919509818171"> +91 9509818171</a>
                        </li>'
    if ($content -match $oldPhoneLiRegex) {
        $content = $content -replace $oldPhoneLiRegex, $newPhoneLi
        Write-Host "  Updated Footer Phone"
    }

    # Replace the whatsapp li (if it uses tel: link)
    $oldWaLiRegex = '(?s)<li>\s*<i class="fa fa-whatsapp"></i>\s*<a href="tel:\+918107057573">\s*\+91 8107057573</a>\s*</li>'
    $newWaLi = '<li>
                          <i class="fa fa-whatsapp"></i>
                          <a href="https://wa.me/918107057573"> +91 8107057573</a>
                        </li>'
    if ($content -match $oldWaLiRegex) {
        $content = $content -replace $oldWaLiRegex, $newWaLi
        Write-Host "  Updated Footer WhatsApp"
    }

    # 4. Global tel: link replacement (for anything missed)
    # Be careful not to replace wa.me links
    $content = $content -replace 'href="tel:\+918107057573"', 'href="tel:+919509818171"'
    $content = $content -replace 'href="tel:918107057573"', 'href="tel:+919509818171"'

    $content | Set-Content -Path $file.FullName -Encoding UTF8
}

Write-Host "Done!"
