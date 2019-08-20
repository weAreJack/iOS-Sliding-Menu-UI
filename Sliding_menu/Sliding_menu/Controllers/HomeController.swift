//
//  HomController.swift
//  Sliding_menu
//
//  Created by Jack Smith on 17/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class HomeController : UIViewController {
    
    // MARK: - Properties
    
    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "home"))
    var delegate : ContainerDelegate?
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Handlers
    
    fileprivate func setupViews() {
        
        view.backgroundColor = .colour3
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menuIcon"), style: .plain, target: self, action: #selector(handleMenuToggle))
        navigationItem.leftBarButtonItem?.tintColor = .colour1
        
    }
    
    @objc fileprivate func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
}
