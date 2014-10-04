//
//  EMEmojiModel.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 9/30/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Foundation

class EMEmojiModel: NSObject {
    
    let modelJson: JSON
    let name: String
    
    init(json:JSON) {
        self.modelJson = json;
        if let theName = json["aliases"][0].asString {
            self.name = theName
        } else {
            self.name = "No Name?"
        }
    }
}