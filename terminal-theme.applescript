tell application "Terminal"
    -- Get current system appearance
    set currentMode to do shell script "defaults read -g AppleInterfaceStyle 2>/dev/null || echo 'Light'"
    
    -- Set your preferred profile names
    set lightProfile to "Novel"         -- light mode
    set darkProfile to "Homerbrew"      -- dark mode
    
    -- Set the appropriate profile
    if currentMode is "Dark" then
        set default settings to settings set darkProfile
        set startup settings to settings set darkProfile
        -- Change current terminal windows
        repeat with w in windows
            set current settings of w to settings set darkProfile
        end repeat
    else
        set default settings to settings set lightProfile
        set startup settings to settings set lightProfile
        -- Change current terminal windows
        repeat with w in windows
            set current settings of w to settings set lightProfile
        end repeat
    end if
end tell