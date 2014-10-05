//
//  EMCollectionViewItemView.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 9/25/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Cocoa

class EMCollectionViewItemView : NSView {
    
    override func mouseDown(theEvent: NSEvent) {
        if let collectionView: NSCollectionView = self.superview as? NSCollectionView {
            // Find our model from our parent CollectionView's content
            let subviews: NSArray = collectionView.subviews as NSArray
            let index = subviews.indexOfObject(self)
            let content: NSArray = collectionView.content as NSArray
            let model: EMModel = content.objectAtIndex(index) as EMModel
            
            // Copy it to our user's clipboard
            model.copyToUsersClipboard()
        }
    }

}
