//
//  EMPopoverViewController.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 6/21/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Cocoa

class EMPopoverViewController: NSViewController, NSCollectionViewDelegate {
    
    required init(coder aDecoder: NSCoder!) {
        NSLog("--- PopoverVC init w/ coder ")
        super.init(coder: aDecoder)
    }
    
    override init() {
        NSLog("--- PopoverVC normal init")
        super.init()
    }
}
