# MKVCleanup-PowerShell
A simple tool to remove tiltes, tags and subtiltes from multiple mkv containers and regex-rename afterwards

# Requirements
- [MKVToolNix](https://mkvtoolnix.download/downloads.html#windows) - Download and install or use Winget: ```winget install mkvtoolnix ```

# Setup
Edit Line 1: "PATH\TO\YOUR\CLEANUP\FOLDER" accordingly.

# Usage
Run the script via **Right-Click -> "Run with PowerShell"** or **PowerShell** or **CMD**

# Notes
- This script will delete all titles, tags and subtitles from the files in a specified folder and regex-rename them.
- **CAUTION**: Do not use this on your movies/tv folder directly, it might remove desired subtitles.