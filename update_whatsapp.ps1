# Lire le fichier
$content = Get-Content "d:\Learn\portfolio\index.html" -Raw -Encoding UTF8

# Définir l'ancien contenu à remplacer
$oldContent = @'
                    <a href="tel:+261349395072"
                        class="text-gray-400 hover:text-purple-400 transition-colors text-sm md:text-base">
                       +261 034 93 950 72
                    </a>
'@

# Définir le nouveau contenu
$newContent = @'
                    <div class="flex items-center justify-center gap-3">
                        <a href="tel:+261349395072"
                            class="text-gray-400 hover:text-purple-400 transition-colors text-sm md:text-base">
                           +261 034 93 950 72
                        </a>
                        <a href="https://wa.me/261349395072" target="_blank" rel="noopener noreferrer"
                            class="text-green-400 hover:text-green-300 transition-colors text-lg md:text-xl"
                            title="Contactez-moi sur WhatsApp">
                            <i class="fa-brands fa-whatsapp"></i>
                        </a>
                    </div>
'@

# Remplacer le contenu
if ($content -match [regex]::Escape($oldContent)) {
    $content = $content -replace [regex]::Escape($oldContent), $newContent
    Set-Content "d:\Learn\portfolio\index.html" -Value $content -NoNewline -Encoding UTF8
    Write-Host "Modification appliquée avec succès!"
} else {
    Write-Host "Contenu cible non trouvé. Vérification du contenu actuel..."
    # Afficher les lignes 702-705 pour debug
    $lines = Get-Content "d:\Learn\portfolio\index.html" -Encoding UTF8
    $lines[701..704] | ForEach-Object { Write-Host $_ }
}
