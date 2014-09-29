//
//  AppDelegate.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 6/21/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate {

    @IBOutlet var mainPopover: NSPopover!
    
    var popoverViewController: EMPopoverViewController!
    
    var statusItem: NSStatusItem?
    var hipchatEmoticons: NSArray
    var testImage: NSImage?
    
    var popoverTransiencyMonitor: NSEvent?
    
    override init() {
        NSLog("AppDelegate init!")
        hipchatEmoticons = AppDelegate.buildHipchatEmoticons()
        super.init()
    }


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        let bar = NSStatusBar.systemStatusBar()
        statusItem = bar.statusItemWithLength(-1)
        statusItem!.title = nil
        statusItem!.highlightMode = true
        statusItem!.action = "showPopover:"
        
        let icon = NSImage(named: "Icon")
        icon.size = NSSize(width: 16, height: 16)
        icon.setTemplate(true)
        statusItem!.image = icon
        
        NSLog("didFinishLaunching - hipchatEmoticons.count: \(hipchatEmoticons.count)")
    }
    
    func showPopover(sender: AnyObject) {
        // Need to downcast our sender as a view since it's a private class (NSStatusBarButton)
        let statusBarButton = sender as NSView
        mainPopover.showRelativeToRect(NSZeroRect, ofView: statusBarButton, preferredEdge: NSRectEdge.min)
        
        
        if (self.popoverTransiencyMonitor == nil) {
            NSEvent.addGlobalMonitorForEventsMatchingMask((NSEventMask.LeftMouseDownMask |
                NSEventMask.RightMouseDownMask | NSEventMask.KeyUpMask), handler: handleClickOffEvent)
        }
    }
    
    func handleClickOffEvent(aEvent: (NSEvent!)) -> Void {
        // Remove the monitor and set it to nil so we set it again when the user clicks the menu item.
        NSEvent.removeMonitor(self.popoverTransiencyMonitor)
        self.popoverTransiencyMonitor = nil
        
        // Close our popover
        self.mainPopover.close()
    }
    
    class func buildHipchatEmoticons() -> [EMEmoticonModel] {
        if let resourcePath = NSBundle.mainBundle().resourcePath {
            let hipchatIconsPath = resourcePath.stringByAppendingPathComponent("hipchat-emoticons")
            var contents: [String] = NSFileManager.defaultManager().contentsOfDirectoryAtPath(hipchatIconsPath, error: nil) as [String]
            //        NSLog("flattened: \(contents.map({ EMEmoticonModel.instanceOrNil($0) }).filter({ $0 != nil }).map({ $0! }))")
            //        contents = contents[1...5]
            return contents.map({ EMEmoticonModel.instanceOrNil($0) }).filter({ $0 != nil }).map({ $0! })
        } else {
            return Array()
        }
    }
}

