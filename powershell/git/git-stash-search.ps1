git stash list | ForEach-Object {
    $stash = ($_ -split ':')[0] 
    $matches = git stash show -p $stash | Select-String -Pattern "word_to_search"
    
    if ($matches) {
        Write-Host "Searching in $stash..."
        $matches | ForEach-Object { $_.Line }
    }
}