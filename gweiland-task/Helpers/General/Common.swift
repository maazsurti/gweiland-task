//
//  Common.swift
//  Nounou
//
//  Created by Maaz on 07/08/23.
//

import Foundation
import UIKit

class Common{
    
//    static func logout(){
//        
//        UserData.isUserLoggedIn = false
//        UserData.username.removeAll()
//        UserData.userEmail.removeAll()
//        UserData.userID = Int()
//        // UserData.localCartData.removeAll()
//        UserData.userPhoneNumber.removeAll()
//        UserData.authToken.removeAll()
//        
//        UserData.isUserLoggedIn = false
//        
//        setRootVC(with: SignInVC())
//    }
//    
//    static func loginAndStoreUserDataLocally(model: UserModel){
//        
//        UserData.isUserLoggedIn = true
//        UserData.username = "\(model.firstName ?? "")"
//        UserData.userID = model.id ?? 0
//        UserData.userEmail = model.email ?? ""
//        UserData.userPhoneNumber = model.mobile ?? ""
//        
//        
//        setRootVC(with: TabBarController())
//    }
//    
//    static func getInitialViewController() -> UIViewController {
//        
//        if UserData.isFirstLaunch {
//            
//            return LanguageSelectVC()
//            
//        }  else {
//            
//            if UserData.isUserLoggedIn {
//                
//                return TabBarController()
//                
//            } else {
//                
//                return SignInVC()
//            }
//        }
//    }
    
    static func setInitialRootVC(with viewController: UIViewController, window: UIWindow, sceneDelegate: SceneDelegate) {
        let vc = viewController
        let rootViewController = UINavigationController(rootViewController: vc)
        window.rootViewController = rootViewController
        window.backgroundColor = .white
        window.overrideUserInterfaceStyle = .light
        window.makeKeyAndVisible()
        sceneDelegate.window = window
        
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        UIView.transition(with: window, duration: duration, options: options, animations: {})
    }
}

