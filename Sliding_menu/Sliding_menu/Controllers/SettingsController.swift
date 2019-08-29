//
//  SettingsController.swift
//  Sliding_menu
//
//  Created by Jack Smith on 17/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class SettingsController : UIViewController {
    
    // MARK: - Properties
    
    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "settings"))
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Handlers
    
    fileprivate func setupViews() {
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        navigationItem.title = "Settings"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDismiss))
        navigationItem.rightBarButtonItem?.tintColor = .colour5
        view.backgroundColor = .colour5
    }
    
}
