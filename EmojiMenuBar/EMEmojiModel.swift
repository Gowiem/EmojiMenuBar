//
//  EMEmojiModel.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 9/30/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Foundation

class EMEmojiModel: EMModel {
    
    let modelJson: JSON
    let emoji: String
    let tags: NSArray
    
    init(json:JSON) {

        self.modelJson = json;
        var name = "No Name"
        if let theName = json["aliases"][0].asString {
            name = theName
        }
        
        if let theTags = json["tags"].asArray {
            self.tags = theTags
        } else {
            self.tags = []
        }
        
        if let theEmoji = json["emoji"].asString {
            self.emoji = theEmoji
        } else {
            self.emoji = "None :("
        }
        
        super.init(seperators: [":", ":"], name: name)
    }
}