////
////  LoadingAnimationVC.swift
////  Reflex
////
////  Created by Maaz on 25/09/22.
////
//
//import Foundation
//import UIKit
//import NVActivityIndicatorView
//
//
//class Loading {
//
//    static let animation = NVActivityIndicatorView(frame: .zero, type: .ballScaleMultiple, color: primary, padding: 0)
//    
//    static let backgroundView = UIView()
//    
//    static func start() {
//        
//        animation.translatesAutoresizingMaskIntoConstraints = false
//        animation.alpha = 0
//        let window = UIApplication.shared.keyWindow
//        let screen = UIScreen.main.bounds
//        
//        window?.addSubview(backgroundView)
//        backgroundView.frame = CGRect(x: 0, y: 0, width: screen.width, height: screen.height)
//        
//        backgroundView.addSubview(animation)
//        animation.centerToX()
//        animation.centerToY()
//        
//        animation.setWidth(backgroundView.width/4)
//        animation.setHeight(backgroundView.width/4)
//        
//        UIView.animate(withDuration: 0.3, animations: {
//            
//            animation.alpha = 1
//            self.backgroundView.backgroundColor = .black.withAlphaComponent(0.4)
//        })
//        
//        animation.startAnimating()
//    }
//    
//    static func stop() {
//        
//        UIView.animate(withDuration: 0.3, animations: {
//            
//            
//            self.backgroundView.backgroundColor = .black.withAlphaComponent(0)
//            animation.alpha = 0
//            
//        }) { completed in
//            
//            if completed {
//                
//                self.backgroundView.removeFromSuperview()
//                
//            }
//        }
//    }
//}
