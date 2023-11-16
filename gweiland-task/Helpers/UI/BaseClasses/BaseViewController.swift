//
//  BaseViewController.swift
//  RCD1
//
//  Created by Maaz on 07/09/22.
//

import UIKit

class BaseViewController: UIViewController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }

    func configure() {
        
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        
    }
    
    func setConstraints() {
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setConstraints()
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = (navigationController.viewControllers.count > 1) ? self : nil
        navigationController.interactivePopGestureRecognizer?.isEnabled = (navigationController.viewControllers.count > 1) ? true : false
    }
}
