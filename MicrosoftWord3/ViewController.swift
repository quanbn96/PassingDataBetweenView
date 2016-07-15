//
//  ViewController.swift
//  MicrosoftWord3
//
//  Created by Quan on 7/15/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OptionsDelegate {

    @IBOutlet weak var txt_View: UITextView!
    
    var style : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_View.textColor = UIColor.blackColor()
    }
    

    override func viewDidLayoutSubviews() {
       txt_View.setContentOffset(CGPointZero, animated: false)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Option" {
            let destination = segue.destinationViewController as! PassingOptionVC
            print(self.style)
            destination.option = OptionsFont(size: Int((txt_View.font?.pointSize)!), fontName: (txt_View.font?.fontName)!, color: txt_View.textColor!, alignment: txt_View.textAlignment.rawValue, styleName: self.style)
            destination.delegate = self
        }
    }
    
    func setColor(colorName: UIColor) {
        txt_View.textColor = colorName
    }
    
    func setFont(font : UIFont) {
        txt_View.font = font
    }
    
    func setAlign(valueAlign : Int) {
        txt_View.textAlignment = NSTextAlignment(rawValue: valueAlign)!
    }
    
    func setStyle(style : String, size: Int, fontName: String) {
        self.style = style
        
        switch style {
        case "B":
            self.resetFontForTextView(size, fontName: fontName)
            txt_View.font = UIFont.boldSystemFontOfSize(CGFloat(size))
        case "I":
            self.resetFontForTextView(size, fontName: fontName)
            self.txt_View.font = UIFont.italicSystemFontOfSize(CGFloat(size))
        case "U":
            self.resetFontForTextView(size, fontName: fontName)
            
            let font = UIFont(name: fontName, size: CGFloat(size))
            let attributes = [NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleSingle.rawValue,
                              NSFontAttributeName : font!]
            txt_View.attributedText = NSAttributedString(string: txt_View.text!, attributes:attributes)

            
        default:
            break
        }
    }
    
    func setNoneUnderlineForTxtView() {
        let underlineAttriString = NSAttributedString(string: txt_View.text!, attributes: [NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleNone.rawValue])
        txt_View.attributedText = underlineAttriString

    }
    
    func resetFontForTextView(size: Int, fontName: String) {
        //set none underline
        let underlineAttriString = NSAttributedString(string: txt_View.text!, attributes: [NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleNone.rawValue])
        txt_View.attributedText = underlineAttriString
        
        //resetFont
        txt_View.font = UIFont(name: fontName, size: CGFloat(size))
    }

}

