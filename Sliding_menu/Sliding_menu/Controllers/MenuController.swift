//
//  MenuController.swift
//  Sliding_menu
//
//  Created by Jack Smith on 17/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class MenuController : UITableViewController {
    
    // MARK: - Properties
    
    fileprivate let header = MenuHeader()
    fileprivate let reuseIdentifier = "menuOption"
    
    var delegate : ContainerDelegate?
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    // MARK: - Handlers
    
    fileprivate func setupViews() {
        
        view.backgroundColor = .white
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = view.frame.height/10
        tableView.isScrollEnabled = false
        
        header.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleHeaderTap)))
        
    }
    
    @objc fileprivate func handleHeaderTap(){
        let option = menuOption(rawValue: 0)
        delegate?.handleMenuToggle(forMenuOption: option)
    }
    
    // MARK: - Tableview Datasource
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = menuOption(rawValue: indexPath.row+1)
        delegate?.handleMenuToggle(forMenuOption: option)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
        
        let option = menuOption(rawValue: indexPath.row+1)
        cell.descriptionLabel.text = option?.description
        cell.iconImageView.image = option?.image.withRenderingMode(.alwaysTemplate)
        
        return cell
    }
    
    
}
