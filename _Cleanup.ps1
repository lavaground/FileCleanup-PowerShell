param (
  [string]$SearchFor = "(^.*S[\d]+E[\d]+).*", 
  [string]$ReplaceWith = "`$1.720p.x265.mkv",
  [string]$FileExtension = "mkv",
  [string]$RootFolder = "PATH\TO\YOUR\CLEANUP\FOLDER\"
)

$SeperatorString = "`n==============================================================================================================`n"
$RemuxErrorString = "Warnings/errors generated during remuxing, original file not deleted"
$NoRenamesString = "Nothing to rename"
$NoFilesString = "No files found."
$CompletedString = "Operation completed."

Write-Output $SeperatorString
Write-Output "Enumerating all $FileExtension files in $RootFolder"
Write-Output $SeperatorString
$Files = Get-ChildItem $RootFolder -Recurse -Include *.$FileExtension

if ($Files.Count -gt 0) {
  $Files | ForEach-Object {
    Write-Output "Cleaning titles in file $_."
    Write-Output $SeperatorString
    mkvpropedit "$_" -d title
    mkvpropedit "$_" -e track:v1 -d name
    mkvpropedit "$_" -e track:a1 -d name
    mkvpropedit "$_" -e track:s1 -d name
    Write-Output $SeperatorString
    Write-Output "Title cleaning in file $_ is done."
    Write-Output $SeperatorString
    Write-Output "Searching for subtiltes in $_."
    Write-Output $SeperatorString
    $File = mkvmerge -i $_
    $HasSub = $File[-1].Contains("subtitles")
    if ($HasSub) {
      Write-Output "$_ has subtitles."
      Write-Output $SeperatorString
      $NewName = $_.FullName -replace $SearchFor, $ReplaceWith
      mkvmerge -q -o "$NewName" -S $_
      if ($LASTEXITCODE -eq 1) {
        Write-Output $RemuxErrorString
      }
      else {
        remove-Item $_
        Write-Output "Successfully remuxed to $NewName, original file deleted"
      }
    }
    else {
      Write-Output "$_ has no subtitles, renaming file."
      $NewName = $_.FullName -replace $SearchFor, $ReplaceWith
      if ($_.FullName -ne $NewName) {
        Rename-Item -Path $_.FullName -NewName $NewName
      }
      else {
        Write-Output $SeperatorString
        Write-Output $NoRenamesString
      }
    }
  }
}
else {
  Write-Output $NoFilesString
}

Write-Output $SeperatorString
Write-Output $CompletedString
Write-Output $SeperatorString