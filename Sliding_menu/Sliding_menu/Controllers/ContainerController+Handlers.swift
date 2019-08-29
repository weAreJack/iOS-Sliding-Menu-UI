//
//  ContainerController+Handlers.swift
//  Sliding_menu
//
//  Created by Jack Smith on 28/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension ContainerController {
    
    func configureHomeController(){
        homeController.delegate = self
        homeNavigationContoller = UINavigationController(rootViewController: homeController)
        view.addSubview(homeNavigationContoller.view)
        addChild(homeNavigationContoller)
        homeNavigationContoller.didMove(toParent: self)
    }
    
    func configureMenuController(){
        menuController.delegate = self
        menuController.view.frame = menuStartFrame
        view.addSubview(menuController.view)
        addChild(menuController)
        menuController.didMove(toParent: self)
        view.addGestureRecognizer(screenEdgePan)
    }
    
    func animateMenuPanel(shouldExpand: Bool, menuOption: MenuOption?){
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
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
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
    
    fileprivate func didSelectMenuOption(menuOption: MenuOption){
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
