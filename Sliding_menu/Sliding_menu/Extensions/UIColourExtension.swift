//
//  UIColourExtensions.swift
//  Sliding_menu
//
//  Created by Jack Smith on 20/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let colour1 = UIColor(r: 141, g: 106, b: 159)
    static let colour2 = UIColor(r: 197, g: 203, b: 211)
    static let colour3 = UIColor(r: 140, g: 188, b: 185)
    static let colour4 = UIColor(r: 221, g: 164, b: 72)
    static let colour5 = UIColor(r: 182, g: 52, b: 47)
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
}
