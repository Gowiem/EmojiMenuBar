//
//  EMModel.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 10/4/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Foundation
import SpriteKit

class EMModel: NSObject {
    
    let seperators: [String]
    let name: String
    
    init(seperators: [String], name: String) {
        self.seperators = seperators
        self.name = name
    }
    
    func presentedRepresentation() -> String {
        if countElements(self.name) > 10 {
            var smallerName = self.name as NSString
            smallerName = smallerName.substringWithRange(NSRange(location: 0, length:10))
            return "\(self.seperators[0])\(smallerName)...\(self.seperators[1])"
        } else {
            return "\(self.seperators[0])\(self.name)\(self.seperators[1])"
        }
    }
   
    func clipboardRepresentation() -> String {
        return "\(self.seperators[0])\(self.name)\(self.seperators[1])"
    }

    // Add the model's name to the clipboard
    func copyToUsersClipboard() {
        let pasteBoard = NSPasteboard.generalPasteboard()
        pasteBoard.clearContents()
        pasteBoard.setString(self.clipboardRepresentation(), forType: NSStringPboardType)
    }
}
