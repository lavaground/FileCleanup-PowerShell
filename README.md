# MKVCleanup-PowerShell
A simple tool to remove titles, tags and subtiltes from multiple mkv containers and regex-rename afterwards

# Requirements
- [MKVToolNix](https://mkvtoolnix.download/downloads.html#windows) - Download and install or use Winget: ```winget install mkvtoolnix ```

# Setup
- Add the MKVToolNix Folder to your PATH
- Edit Line 01: "PATH\TO\YOUR\CLEANUP\FOLDER"
- Edit Line 32: RegEx pattern or leave it as it is
- Edit Line 42: RegEx pattern or leave it as it is

# Usage
Run the script via **Right-Click -> "Run with PowerShell"** or **PowerShell** or **CMD**

# Notes
- This script will delete all titles, tags and subtitles from the files in a specified folder and regex-rename them.
- The RegEx is set for ```*.720p.x265.mkv``` filenames for Movies and ```*.S**E**.720p.x265.mkv``` for TV Shows.
- **CAUTION**: Do not use this on your movies/tv folder directly, it might remove desired subtitles.