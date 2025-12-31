# Script pour corriger l'encodage des caractères spéciaux dans index.html

# Lire le fichier avec l'encodage actuel
$content = Get-Content "d:\Learn\portfolio\index.html" -Raw -Encoding UTF8

# Dictionnaire de remplacement pour les caractères mal encodés
$replacements = @{
    "Ã©" = "é"
    "Ã¨" = "è"
    "Ã " = "à"
    "Ã´" = "ô"
    "Ã®" = "î"
    "Ã§" = "ç"
    "Ã»" = "û"
    "Ã¢" = "â"
    "Ãª" = "ê"
    "Ã¹" = "ù"
    "Ã«" = "ë"
    "Ã¯" = "ï"
    "Ã" = "À"
    "Ã‰" = "É"
    "Ãˆ" = "È"
    "Ã"" = "Ô"
    "Â©" = "©"
    "â™¥" = "♥"
}

# Appliquer tous les remplacements
foreach ($key in $replacements.Keys) {
    $content = $content -replace [regex]::Escape($key), $replacements[$key]
}

# Sauvegarder le fichier avec le bon encodage UTF-8
$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText("d:\Learn\portfolio\index.html", $content, $utf8NoBom)

Write-Host "Correction des caractères spéciaux terminée avec succès!" -ForegroundColor Green
