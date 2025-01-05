# macos-terminal-theme-sync

Automatically switch Terminal.app themes based on macOS light/dark mode changes

To run simply execute the following script without downloading anything:

```sh
mkdir -p ~/Library/Scripts
mkdir -p ~/Library/LaunchAgents

touch ~/Library/LaunchAgents/com.user.terminalpref.plist
echo https://raw.githubusercontent.com/RahanBenabid/macos-terminal-theme-sync/refs/heads/main/com.user.terminalpref.plist > ~/Library/LaunchAgents/com.user.terminalpref.plist

touch ~/Library/Scripts/terminal-theme.applescript
echo https://raw.githubusercontent.com/RahanBenabid/macos-terminal-theme-sync/refs/heads/main/terminal-theme.applescript > ~/Library/Scripts/terminal-theme.applescript

touch ~/Library/Scripts/ThemeWatcher.swift
echo https://raw.githubusercontent.com/RahanBenabid/macos-terminal-theme-sync/refs/heads/main/ThemeWatcher.swift > ~/Library/Scripts/ThemeWatcher.swift

swiftc ~/Library/Scripts/ThemeWatcher.swift -o ~/Library/Scripts/ThemeWatcher

launchctl unload ~/Library/LaunchAgents/com.user.terminalpref.plist
launchctl load ~/Library/LaunchAgents/com.user.terminalpref.plist
```

> Note: I used Homebrew and Novel and an example, you can modify them to whatever you want once the `terminal-theme.applescript` is in your `~/Library/Scripts/` directory, just change the line 6 and 7.

#macos #terminal #theme #dark-mode #light-mode #automation #applescript #swift

