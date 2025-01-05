import Cocoa

class AppearanceMonitor: NSObject {
    let script = """
        tell application "Terminal"
            -- Get current system appearance
            set currentMode to do shell script "defaults read -g AppleInterfaceStyle 2>/dev/null || echo 'Light'"
            
            -- Set your preferred profile names
            set lightProfile to "Alabaster"
            set darkProfile to "Afterglow"
            
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
    """
    
    override init() {
        super.init()
        DistributedNotificationCenter.default().addObserver(
            self,
            selector: #selector(appearanceChanged),
            name: NSNotification.Name("AppleInterfaceThemeChangedNotification"),
            object: nil
        )
    }
    
    @objc func appearanceChanged() {
        let task = Process()
        task.launchPath = "/usr/bin/osascript"
        task.arguments = ["-e", script]
        task.launch()
    }
}

let monitor = AppearanceMonitor()
RunLoop.main.run()