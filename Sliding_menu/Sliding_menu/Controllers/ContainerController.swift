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
    
    fileprivate var menuController = MenuController()
    fileprivate var homeController = HomeController()
    fileprivate var homeNavigationContoller : UIViewController!
    fileprivate var isExpanded = false
    
    fileprivate lazy var menuStartPosX : CGFloat = -view.frame.width+70
    fileprivate lazy var menuStartPosY : CGFloat = 0
    fileprivate lazy var menuWidth : CGFloat = view.frame.width-70
    fileprivate lazy var menuHeight : CGFloat = view.frame.height
    
    fileprivate lazy var menuStartFrame = CGRect(x: menuStartPosX, y: menuStartPosY, width: menuWidth, height: menuHeight)
    fileprivate lazy var menuEndFrame = CGRect(x: 0, y: menuStartPosY, width: menuWidth, height: menuHeight)
    
    fileprivate lazy var openThreshold : CGFloat = -((view.frame.width-70)/2)
    fileprivate lazy var menuReturnPan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
    fileprivate lazy var screenEdgePan : UIScreenEdgePanGestureRecognizer = {
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
    
    // MARK: - Handlers

    fileprivate func configureHomeController(){
        
        homeController.delegate = self
        homeNavigationContoller = UINavigationController(rootViewController: homeController)
        view.addSubview(homeNavigationContoller.view)
        addChild(homeNavigationContoller)
        homeNavigationContoller.didMove(toParent: self)
        
    }
    
    fileprivate func configureMenuController(){
        
        menuController.delegate = self
        menuController.view.frame = menuStartFrame
        view.addSubview(menuController.view)
        
        addChild(menuController)
        menuController.didMove(toParent: self)
        
        view.addGestureRecognizer(screenEdgePan)
    }
    
    fileprivate func animateMenuPanel(shouldExpand: Bool, menuOption: menuOption?){
        
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.menuController.view.frame.origin.x = 0
            }, completion: nil)
            
            self.view.removeGestureRecognizer(screenEdgePan)
            self.view.addGestureRecognizer(menuReturnPan)
            
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.menuController.view.frame.origin.x = self.menuStartPosX
            }) { (_) in
                guard let menuOption = menuOption else {return}
                self.didSelectMenuOption(menuOption: menuOption)
            }
            
            self.view.addGestureRecognizer(screenEdgePan)
            self.view.removeGestureRecognizer(menuReturnPan)
            
        }
        
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            view.layer.removeAllAnimations()
        case .changed:
            handlePanChanged(gesture)
        case .ended:
            handlePanEnded(gesture)
        default:
            ()
        }
    }
    
    fileprivate func handlePanChanged(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)
        
        menuController.view.center = CGPoint(x: min(menuController.view.center.x, menuWidth/2)  + translation.x, y: menuController.view.center.y)
        gesture.setTranslation(CGPoint.zero, in: self.view)
        
    }
    
    fileprivate func handlePanEnded(_ gesture: UIPanGestureRecognizer) {
        
        let shouldOpenMenu : Bool
        
        shouldOpenMenu = menuController.view.frame.origin.x > openThreshold
        
        if shouldOpenMenu {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.menuController.view.frame.origin.x = 0
            })
            
            self.view.removeGestureRecognizer(screenEdgePan)
            self.view.addGestureRecognizer(menuReturnPan)
            
            isExpanded = !isExpanded
            
        } else {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.menuController.view.frame.origin.x = self.menuStartPosX
            })
            
            self.view.addGestureRecognizer(screenEdgePan)
            self.view.removeGestureRecognizer(menuReturnPan)
            
            isExpanded = !isExpanded
            
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
        isExpanded = !isExpanded
        animateMenuPanel(shouldExpand: isExpanded, menuOption: forMenuOption)
    }
    
}

