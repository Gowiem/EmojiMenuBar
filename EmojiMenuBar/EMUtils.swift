//
//  EMUtils.swift
//  EmojiMenuBar
//
//  Created by Matt Gowie on 6/22/14.
//  Copyright (c) 2014 Artisan. All rights reserved.
//

import Foundation

extension NSString {
    func contains(substring: NSString) -> Bool {
        var range: NSRange = self.rangeOfString(substring)
        return range.location != NSNotFound
    }
}

extension Array {
    func flatten() -> Array! {
        return self.filter({ $0 != nil })
    }
}