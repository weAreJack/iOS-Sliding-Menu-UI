//
//  MenuHeader.swift
//  Sliding_menu
//
//  Created by Jack Smith on 19/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class MenuHeader : UIView {
    
    // MARK: - Properties
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Profile Name"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "Profile Description"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let profileImageView : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    func setupUI() {
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.layer.cornerRadius = 60
        
        let labelsStack = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        labelsStack.axis = .vertical
        labelsStack.spacing = 8
        labelsStack.distribution  = .fillEqually
        
        addSubview(labelsStack)
        labelsStack.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16).isActive = true
        labelsStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
}

