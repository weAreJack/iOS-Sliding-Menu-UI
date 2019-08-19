//
//  File.swift
//  Sliding_menu
//
//  Created by Jack Smith on 17/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class HelpController : UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    // MARK: - Handlers
    
    fileprivate func setupViews() {
        navigationItem.title = "Help"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDismiss))
        view.backgroundColor = .purple
    }
    
}
