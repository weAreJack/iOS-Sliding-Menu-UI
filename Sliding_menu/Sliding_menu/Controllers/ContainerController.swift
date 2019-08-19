//
//  ViewController.swift
//  Sliding_menu
//
//  Created by Jack Smith on 17/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

protocol ContainerDelegate {
    func handleMenuToggle(forMenuOption: menuOption?)
}

class ContainerController: UIViewController {
    
    // MARK: - Properties
    
    fileprivate var menuController : MenuController!
    fileprivate var homeController = HomeController()
    fileprivate var centreContoller : UIViewController!
    fileprivate var isExpanded = false
    
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    // MARK: - Handlers

    fileprivate func configureHomeController(){
            homeController.delegate = self
            centreContoller = UINavigationController(rootViewController: homeController)
            view.addSubview(centreContoller.view)
            addChild(centreContoller)
            centreContoller.didMove(toParent: self)
    }
    
    fileprivate func configureMenuController(){
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            setupStatusBarCover()

        }
    }
    
    fileprivate func setupStatusBarCover() {
        
        let statusBarCover = UIView()
        statusBarCover.backgroundColor = .white
        statusBarCover.translatesAutoresizingMaskIntoConstraints = false
        
        view.insertSubview(statusBarCover, at: 0)
        
        statusBarCover.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        statusBarCover.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        statusBarCover.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        statusBarCover.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    fileprivate func animateMenuPanel(shouldExpand: Bool, menuOption: menuOption?){
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centreContoller.view.frame.origin.x = self.centreContoller.view.frame.width - 80
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centreContoller.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else {return}
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
    }
    
    fileprivate func didSelectMenuOption(menuOption: menuOption){
        switch menuOption {
        case .Profile:
            let profileView = ProfileController()
            present(UINavigationController(rootViewController: profileView), animated: true, completion: nil)
        case .Settings:
            let settingsView = SettingsController()
            present(UINavigationController(rootViewController: settingsView), animated: true, completion: nil)
        case .Help:
            let helpView = HelpController()
            present(UINavigationController(rootViewController: helpView), animated: true, completion: nil)
        case .Legal:
            let legalView = LegalController()
            present(UINavigationController(rootViewController: legalView), animated: true, completion: nil)
        }
    }

}

extension ContainerController : ContainerDelegate {
    
    func handleMenuToggle(forMenuOption: menuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        isExpanded = !isExpanded
        animateMenuPanel(shouldExpand: isExpanded, menuOption: forMenuOption)
    }
    
}

