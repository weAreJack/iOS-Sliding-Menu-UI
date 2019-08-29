//
//  MenuOptionCell.swift
//  Sliding_menu
//
//  Created by Jack Smith on 19/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    
    // MARK: - Properties
    
    let descriptionLabel = ProfileCell.setupLabel(titleText: nil, font: .systemFont(ofSize: 16))
    
    var menuOption : MenuOption? {
        didSet {
            descriptionLabel.text = menuOption?.description
            iconImageView.image = menuOption?.image.withRenderingMode(.alwaysTemplate)
        }
    }
    
    let iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    fileprivate func setupViews() {
        
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(iconImageView)
        addSubview(descriptionLabel)
        
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
        
    }
    
}

