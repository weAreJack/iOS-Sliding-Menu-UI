//
//  ViewControllerExtensions.swift
//  Sliding_menu
//
//  Created by Jack Smith on 19/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupNavBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(handleDismiss))
    }
    
    @objc func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
