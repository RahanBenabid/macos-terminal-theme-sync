# macos-terminal-theme-sync

Automatically switch Terminal.app themes based on macOS light/dark mode changes

## Prerequisites
- Xcode installed to compile Swift scripts.

To run simply execute the following script without downloading anything:

```sh
mkdir -p ~/Library/Scripts
mkdir -p ~/Library/LaunchAgents

curl -o ~/Library/LaunchAgents/com.user.terminalpref.plist https://raw.githubusercontent.com/RahanBenabid/macos-terminal-theme-sync/main/com.user.terminalpref.plist
curl -o ~/Library/Scripts/terminal-theme.applescript https://raw.githubusercontent.com/RahanBenabid/macos-terminal-theme-sync/main/terminal-theme.applescript
curl -o ~/Library/Scripts/ThemeWatcher.swift https://raw.githubusercontent.com/RahanBenabid/macos-terminal-theme-sync/main/ThemeWatcher.swift

swiftc ~/Library/Scripts/ThemeWatcher.swift -o ~/Library/Scripts/ThemeWatcher

launchctl unload ~/Library/LaunchAgents/com.user.terminalpref.plist
launchctl load ~/Library/LaunchAgents/com.user.terminalpref.plist
```

## IMPORTANT

- The example uses “Homebrew” and “Novel” as light and dark Terminal themes, respectively. You can modify these in the `terminal-theme.applescript`  file found in your ` ~/Library/Scripts/` directory by editing lines 6 and 7 to match your preferred themes.

- You NEED to replace the `$USER` variable in your `~/Library/LaunchAgents/com.user.terminalpref.plist` with your actual username, if you're confused just execute `echo $USER` in your terminal and replace the variable with the output you got

- if you want more themes i recommend getting them from [here](https://github.com/lysyi3m/macos-terminal-themes)


#macos #terminal #theme #dark-mode #light-mode #automation #applescript #swift

