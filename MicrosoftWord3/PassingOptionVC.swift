//
//  PassingOptionVC.swift
//  MicrosoftWord3
//
//  Created by Quan on 7/15/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

protocol OptionsDelegate {
    func setColor(colorName : UIColor)
    func setFont(font : UIFont)
    func setAlign(valueAlign : Int)
    func setStyle(style : String, size: Int, fontName: String)
}

class PassingOptionVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var currentSize: UITextField!
    
    @IBOutlet weak var currentFontName: UITextField!
    
    @IBOutlet weak var currentColor: UILabel!
    
    @IBOutlet weak var currentAlign: UILabel!
    
    @IBOutlet weak var currentStyle: UILabel!
    
    var option : OptionsFont!
    var delegate : OptionsDelegate! = nil
    var style : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentSize.delegate = self
        currentFontName.delegate = self
        
        self.currentSize.text = String(option.size!)
        self.currentFontName.text = String(option.fontName!)
        self.currentColor.backgroundColor = option.color
        self.currentStyle.text = option.styleName
        
        switch self.option.alignment {
        case 0:
            self.currentAlign.text = "Lef"
        case 1:
            self.currentAlign.text = "Cen"
        case 2:
            self.currentAlign.text = "Rig"
        default:
            break
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        print("\(self.style) passing")
    }
    
    
    @IBAction func touchUpInsideSelectedStyle(sender: UIButton) {
        let style = sender.currentTitle!
        self.currentStyle.text = style
        self.style = style
    }
    
    override func viewWillDisappear(animated: Bool) {
        let size = Int(currentSize.text!)!
        let fontName = currentFontName.text!
        let font = UIFont(name: fontName, size: CGFloat(size))
        self.delegate.setFont(font!)
        self.delegate.setStyle(self.style, size: size, fontName: fontName)
    }

    @IBAction func touchUpInsideSelectedColor(sender: UIButton) {
        if let color = sender.backgroundColor {
            currentColor.backgroundColor = color
            self.delegate.setColor(color)
        }
    }
    
    @IBAction func touchUpInsideSelectedAlign(sender: UIButton) {
        let value = sender.tag - 100
        self.delegate.setAlign(value)
        switch value {
        case 0:
            currentAlign.text = "Lef"
        case 1:
            currentAlign.text = "Cen"
        case 2:
            currentAlign.text = "Rig"
        default:
            break
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
