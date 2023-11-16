////
////  WebviewView.swift
////  Nounou
////
////  Created by Maaz on 04/07/23.
////
//
//import Foundation
//import UIKit
//import Stevia
//import WebKit
//
//class WebviewView: BaseViewWithNavBar{
//    
//    lazy var loadingAnimation: UIActivityIndicatorView = {
//        
//        let view = UIActivityIndicatorView(style: .large)
//        view.hidesWhenStopped = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.isHidden = false
//        return view
//        
//    }()
//    
//    lazy var webView: WKWebView = {
//        
//        let webView = WKWebView()
//        webView.configuration.userContentController.addUserScript(getZoomDisableScript())
//        return webView
//        
//    }()
//    
//    override func configure() {
//        super.configure()
//        
//        subviews{
//            webView
//            loadingAnimation
//        }
//        
//        webView.Leading == Leading
//        webView.Trailing == Trailing
//        webView.Bottom == safeAreaLayoutGuide.Bottom
//        webView.Top == navBar.Bottom
//        
//        loadingAnimation.centerVertically()
//        loadingAnimation.centerHorizontally()
//    }
//}
