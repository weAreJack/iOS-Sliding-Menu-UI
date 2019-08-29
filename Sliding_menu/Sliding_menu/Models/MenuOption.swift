//
//  MenuOption.swift
//  Sliding_menu
//
//  Created by Jack Smith on 17/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

enum MenuOption : Int, CustomStringConvertible {
    
    case Profile
    case Settings
    case Help
    case Legal
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Settings: return "Settings"
        case .Help: return "Help"
        case .Legal: return "Legal"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named: "profileIcon") ?? UIImage()
        case .Settings: return UIImage(named: "settingsIcon") ?? UIImage()
        case .Help: return UIImage(named: "helpIcon") ?? UIImage()
        case .Legal: return UIImage(named: "legalIcon") ?? UIImage()
        }
    }
}

