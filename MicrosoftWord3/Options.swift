//
//  Options.swift
//  MicrosoftWord3
//
//  Created by Quan on 7/15/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class OptionsFont {
    var size : Int?
    var fontName : String?
    var color : UIColor?
    var alignment : Int!
    var styleName : String!
    
    init(size : Int, fontName : String, color : UIColor, alignment : Int, styleName : String) {
        self.size = size
        self.alignment = alignment
        self.fontName = fontName
        self.color = color
        self.styleName = styleName
    }
    
    class var shareInstance : OptionsFont {
        
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : OptionsFont? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = OptionsFont()
        }
        
        return Static.instance!
    }
    
    init() {
    }
    
}