//
//  MenuController.swift
//  Sliding_menu
//
//  Created by Jack Smith on 17/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class MenuController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    fileprivate let header = ProfileCell()
    fileprivate let reuseIdentifier = "menuOption"
    fileprivate let tableView = UITableView()
    
    var delegate : ContainerDelegate?
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Handlers
    
    fileprivate func setupUI() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.colour1.cgColor,
                                UIColor.white.cgColor,
                                UIColor.colour5.cgColor]
        gradientLayer.locations = [-1, 0.5, 2.5]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-70, height: view.frame.height)
        view.layer.addSublayer(gradientLayer)
        
        view.dropShadow()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "header")
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = view.frame.height/10
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    // MARK: - Tableview Datasource
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        default:
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: option)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return header
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
            cell.menuOption = MenuOption(rawValue: indexPath.row)
            return cell
        }
    }
    
}
