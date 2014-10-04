//
//  AppDelegate.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 6/21/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Cocoa
import Foundation

class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate {

    @IBOutlet var mainPopover: NSPopover!
    
    var statusItem: NSStatusItem?
    var hipchatEmoticons: NSArray
    var emojis: NSArray
    var testImage: NSImage?
    
    var popoverTransiencyMonitor: NSEvent?
    
    override init() {
        NSLog("AppDelegate init!")
        hipchatEmoticons = AppDelegate.buildHipchatEmoticons()
        emojis = AppDelegate.buildEmojiModels()
        super.init()
    }


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        let bar = NSStatusBar.systemStatusBar()
        statusItem = bar.statusItemWithLength(-1)
        statusItem!.title = nil
        statusItem!.highlightMode = true
        statusItem!.action = "showPopover:"
        
        if let icon = NSImage(named: "Icon") {
            icon.size = NSSize(width: 16, height: 16)
            icon.setTemplate(true)
            statusItem!.image = icon
        }
        
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
        if let monitor = self.popoverTransiencyMonitor {
            NSEvent.removeMonitor(monitor)
        }
        self.popoverTransiencyMonitor = nil
        
        // Close our popover
        self.mainPopover.close()
    }
    
    class func buildHipchatEmoticons() -> [EMEmoticonModel] {
        if let resourcePath = NSBundle.mainBundle().resourcePath {
            let hipchatIconsPath = resourcePath.stringByAppendingPathComponent("hipchat-emoticons")
            var contents: [String] = NSFileManager.defaultManager().contentsOfDirectoryAtPath(hipchatIconsPath, error: nil) as [String]
            return contents.map({ EMEmoticonModel.instanceOrNil($0) }).filter({ $0 != nil }).map({ $0! })
        } else {
            return Array()
        }
    }
    
    class func buildEmojiModels() -> NSArray {
        var result: NSArray = NSArray()
        if let resourcePath = NSBundle.mainBundle().resourcePath {
            let emojiDotJson = resourcePath.stringByAppendingPathComponent("emoji.json")
            NSLog("emojiDotJson \(emojiDotJson)")
            let emojiString = String(contentsOfFile: emojiDotJson, encoding: NSUTF8StringEncoding, error: nil)
            let emojiJson = JSON.parse(emojiString!)
            NSLog("jsonObject: \(emojiJson)")
            if let emojiArray = emojiJson.asArray {
                result = emojiArray.map {
                    (singleJson: JSON) -> EMEmojiModel in
                    return EMEmojiModel(json: singleJson)
                }
            }
        }
        return result
    }
}

