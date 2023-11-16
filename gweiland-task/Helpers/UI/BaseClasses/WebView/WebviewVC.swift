////
////  WebviewVC.swift
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
//class WebviewVC: BaseViewController, WKNavigationDelegate {
//    
//    let v = WebviewView(title: "")
//    
//    override func loadView() { view = v }
//    
//    var webPageLoadedCallback: ((_ isSuccess: Bool) ->())?
//    
//    var bookingID = Int()
//    
//    init(title: String, url: String){
//        super.init(nibName: nil, bundle: nil)
//        v.webView.navigationDelegate = self
//        v.titleLabel.text = title.localized()
//        guard let URL = URL(string: url) else {return}
//        v.webView.load(URLRequest(url: URL))
//        v.loadingAnimation.startAnimating()
//        v.backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
//    }
//    
//    @objc
//    func backButtonPressed(){
//        navigationController?.popToRootViewController(animated: false)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
//    }
//}
//
//extension WebviewVC {
//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//       // v.loadingAnimation.isHidden = false
//       
//    }
//}
