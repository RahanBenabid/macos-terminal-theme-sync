import Cocoa

class AppearanceMonitor: NSObject {
    let scriptPath = "\(FileManager.default.homeDirectoryForCurrentUser.path)/Library/Scripts/terminal-theme.applescript"
    
    override init() {
        super.init()
        
        // make sure the script exists
        if !FileManager.default.fileExists(atPath: scriptPath) {
            print("Error: AppleScript file not found at \(scriptPath)")
            return
        }
        
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
        task.arguments = [scriptPath]
        task.launch()
    }
}

let monitor = AppearanceMonitor()
RunLoop.main.run()