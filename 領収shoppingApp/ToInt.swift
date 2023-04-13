//
//  ToInt.swift
//  領収shoppingApp
//
//  Created by NOZOMI ISHII on 2023/04/08.
//

import Foundation
import UIKit

extension UITextField {
    var textToInt: Int {
        let text = self.text
        let int = text.flatMap{Int($0)} ?? 0
        return int
    }
}

let price: Int = priceText
