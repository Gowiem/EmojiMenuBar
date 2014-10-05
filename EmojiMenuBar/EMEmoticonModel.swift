//
//  Emoticon.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 6/22/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Foundation
import SpriteKit

class EMEmoticonModel: EMModel {
    
    var filename: String
    var fileExtension: String
    var image: NSImage?
    
    init(filename: NSString) {
        let components: [String] = filename.componentsSeparatedByString(".") as [String]
        var name = components[0]
        self.filename = filename
        self.fileExtension = components[1]
        let path = NSBundle.mainBundle().pathForResource(name, ofType: fileExtension)
        if let newImage = NSImage(contentsOfFile: path!) {
            self.image = newImage
        }
        super.init(seperators: ["(", ")"], name: name)
    }
    
    class func instanceOrNil(filename: NSString) -> EMEmoticonModel? {
        if filename.contains(".") && !filename.contains(".gif") {
            return EMEmoticonModel(filename: filename)
        } else {
            //NSLog("Skipping filename: \(filename)")
            return nil
        }
    }
    
    func description() -> String {
        return "EmoticonModel - name: \(name) filename: \(filename) \n"
    }
}