//
//  MenuHeader.swift
//  Sliding_menu
//
//  Created by Jack Smith on 19/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class ProfileCell : UITableViewCell {
    
    // MARK: - Properties
    
    fileprivate let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Profile Name"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    fileprivate let descriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "Profile Description"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    fileprivate let profileImageView : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate let bottomSeperator = UIView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    fileprivate func setupUI() {
        
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.layer.cornerRadius = 60
        
        let labelsStack = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        labelsStack.axis = .vertical
        labelsStack.spacing = 8
        labelsStack.distribution  = .fillEqually
        
        addSubview(labelsStack)
        labelsStack.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8).isActive = true
        labelsStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(bottomSeperator)
        bottomSeperator.translatesAutoresizingMaskIntoConstraints = false
        bottomSeperator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomSeperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomSeperator.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomSeperator.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomSeperator.backgroundColor = .black
        
    }
    
}

