//
//  EMCollectionViewController.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 7/14/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Cocoa

class EMCollectionView : NSCollectionView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }

    required init(coder: NSCoder) {
        super.init()
    }
    
    override func newItemForRepresentedObject(object: AnyObject!) -> NSCollectionViewItem! {
        var item = super.newItemForRepresentedObject(object);
        return item;
    }
    
}
