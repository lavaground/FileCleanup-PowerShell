# MKVCleanup-PowerShell
A simple tool to remove titles, tags and subtiltes from multiple mkv containers and regex-rename afterwards

# Requirements
- [MKVToolNix](https://mkvtoolnix.download/downloads.html#windows) - Download and install or use Winget: ```winget install mkvtoolnix ```

# Setup
- Add the MKVToolNix Folder to your PATH

    # Optional - Default Parameters
    - Edit Line 02: RegEx patterns or leave them as they are
    - Edit Line 03: RegEx patterns or leave them as they are
    - Edit Line 04: Change file extension
    - Edit Line 05: "PATH\TO\YOUR\CLEANUP\FOLDER"

    # Usefull RegEx Patterns
    **For Movies**
    - Search for: ```"(^.*720p).*"``` 
    - Replace with: ```"`$1.x265.mkv"``` 

    **For TV Shows**
    - Search for: ```"(^.*S[\d]+E[\d]+).*"```
    - Replace with: ```"`$1.720p.x265.mkv"```

# Usage
Run the script via:
- **Right-Click -> "Run with PowerShell"** 
- **PowerShell** ```.\_Cleanup.ps1```
- **CMD** ```powershell .\_Cleanup.ps1```

    # Optional Parameters
    - ```-FileExtension <string>```
    - ```-ReplaceWith <string>```
    - ```-SearchFor <string>```
    - ```-RootFolder <string>```

# Notes
- This script will delete all titles, tags and subtitles from the files in a specified folder and regex-rename them.
- The RegEx is set for TV Show filenames: ```*.S**E**.720p.x265.mkv```.
- **CAUTION**: Do not use this on your movies/tv folder directly, it might remove desired subtitles.