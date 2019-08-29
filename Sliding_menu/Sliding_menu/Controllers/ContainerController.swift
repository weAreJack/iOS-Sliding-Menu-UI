//
//  ViewController.swift
//  Sliding_menu
//
//  Created by Jack Smith on 17/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

protocol ContainerDelegate {
    func handleMenuToggle(forMenuOption: MenuOption?)
}

class ContainerController: UIViewController {
    
    // MARK: - Properties
    
    var menuController = MenuController()
    var homeController = HomeController()
    var homeNavigationContoller : UIViewController!
    var isExpanded = false
    
    lazy var menuStartPosX : CGFloat = -view.frame.width+70
    lazy var menuWidth : CGFloat = view.frame.width-70
    fileprivate lazy var menuStartPosY : CGFloat = 0
    fileprivate lazy var menuHeight : CGFloat = view.frame.height
    lazy var menuStartFrame = CGRect(x: menuStartPosX, y: menuStartPosY, width: menuWidth, height: menuHeight)
    
    lazy var openThreshold : CGFloat = -((view.frame.width-70)/2)
    lazy var menuReturnPan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
    lazy var screenEdgePan : UIScreenEdgePanGestureRecognizer = {
        let pan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePan))
        pan.edges = .left
        return pan
    }()
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        configureMenuController()
    }

}

extension ContainerController : ContainerDelegate {
    
    func handleMenuToggle(forMenuOption: MenuOption?) {
        isExpanded = !isExpanded
        animateMenuPanel(shouldExpand: isExpanded, menuOption: forMenuOption)
    }
    
}

