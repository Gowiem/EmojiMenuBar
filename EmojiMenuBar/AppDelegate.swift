//
//  AppDelegate.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 6/21/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate {
    
    @IBOutlet var statusMenu: NSMenu
    var statusItem: NSStatusItem?
    @IBOutlet var mainPopover: NSPopover


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        let bar = NSStatusBar.systemStatusBar()
        
        statusItem = bar.statusItemWithLength(CGFloat(NSVariableStatusItemLength))
        statusItem!.title = nil
        statusItem!.menu = statusMenu
        statusItem!.highlightMode = true
        statusItem!.action = "showPopover:"
        
        let icon = NSImage(named: "Icon")
        icon.size = NSSize(width: 16, height: 16)
        icon.setTemplate(true)
        statusItem!.image = icon
    }
    
    func menuNeedsUpdate(menu: NSMenu!) {
        if (menu != self.statusMenu) {
            return
        }
        
        menu.removeAllItems()
        menu.addItem(NSMenuItem(title: "Quit", action: "statusMenuItemQuit_Action:", keyEquivalent: ""))
    }
    
    func statusMenuItemQuit_Action(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
    
    func showPopover(sender: AnyObject) {
        // Need to downcast our sender as a view since it's a private class (NSStatusBarButton)
        let statusBarButton = sender as NSView
        mainPopover.showRelativeToRect(NSZeroRect, ofView: statusBarButton, preferredEdge: NSRectEdge.min)
    }
}

