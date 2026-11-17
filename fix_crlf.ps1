Get-ChildItem -Path bin -File | ForEach-Object {
    $text = [IO.File]::ReadAllText($_.FullName) -replace "`r`n", "`n"
    [IO.File]::WriteAllText($_.FullName, $text, [Text.Encoding]::UTF8)
}
Write-Host "Done: bin/ files converted to LF"
