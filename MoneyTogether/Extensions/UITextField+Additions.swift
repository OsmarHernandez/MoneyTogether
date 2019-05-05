//
//  UITextField+Additions.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 04/05/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

extension UITextField {
    
    @IBInspectable private var doneAccessory: Bool {
        get {
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone {
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    internal func addDoneButtonOnKeyboard() {
        let frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        
        let doneToolbar: UIToolbar = UIToolbar(frame: frame)
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
