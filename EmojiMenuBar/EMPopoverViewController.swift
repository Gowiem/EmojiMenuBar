//
//  EMPopoverViewController.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 6/21/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Cocoa

class EMPopoverViewController: NSViewController, NSCollectionViewDelegate {
    
    @IBOutlet weak var hipchatScrollView: NSScrollView!
    @IBOutlet weak var emojiScrollView: NSScrollView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

//    override func awakeFromNib() {}
    
    func showHipchatTab() {
        hipchatScrollView.hidden = false
        emojiScrollView.hidden = true
    }
    
    func showEmojiTab() {
        hipchatScrollView.hidden = true
        emojiScrollView.hidden = false
    }
    
    @IBAction func controlClicked(sender: NSSegmentedControl) {
        if (sender.isSelectedForSegment(0)) {
            showHipchatTab()
        } else {
            showEmojiTab()
        }
    }
}


