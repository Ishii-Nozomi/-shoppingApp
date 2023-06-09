//
//  Checkbox.swift
//  領収shoppingApp
//
//  Created by NOZOMI ISHII on 2023/04/14.
//

import UIKit

class Checkbox: UIButton {
    // Image
    let checkedImage = UIImage(systemName: "checkmark.circle")
    let uncheckedImage = UIImage(systemName: "circle")
    
    // Bool propety
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked(sender: )), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }


}
