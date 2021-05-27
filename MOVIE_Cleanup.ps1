$rootfolder = "PATH\TO\YOUR\CLEANUP\FOLDER\"
"
==============================================================================================================

Enumerating all MKVs under $rootfolder

==============================================================================================================
"

$files = Get-ChildItem $rootfolder -Recurse -Include *.mkv
if ($files.Count -gt 0) {
  $files | ForEach-Object {
    mkvpropedit.exe "$_" -d title
    mkvpropedit.exe "$_" -e track:v1 -d name
    mkvpropedit.exe "$_" -e track:a1 -d name
    mkvpropedit.exe "$_" -e track:s1 -d name
    Write-Output "
==============================================================================================================

Title cleaning in file $_ is done.

==============================================================================================================

Searching for subtiltes in $_.

==============================================================================================================
"
    $file = mkvmerge -i $_
    $hassub = $file[-1].Contains("subtitles")
    if ($hassub) {
      Write-Output "$_ has subtitles."
      $NewName = $_.FullName -replace "(^.*720p).*", "`$1.x265.mkv"
      mkvmerge -q -o "$NewName" -S $_
      if ($LASTEXITCODE -eq 1) {
        Write-Output "Warnings/errors generated during remuxing, original file not deleted"
      } else {
        remove-Item $_
        Write-Output "Successfully remuxed to $NewName, original file deleted"
      }
    } else {
      Write-Output "$_ has no subtitles, renaming file."
      $NewName = $_.FullName -replace "(^.*720p).*", "`$1.x265.mkv"
      if ($_.FullName -ne $NewName) {
        Rename-Item -Path $_.FullName -NewName $NewName
      } else {
        Write-Output "Nothing to rename"
      }
    }
  }
} else {
  Write-Output "No files found."
}
Write-Output "
==============================================================================================================

Operation completed.

==============================================================================================================
"