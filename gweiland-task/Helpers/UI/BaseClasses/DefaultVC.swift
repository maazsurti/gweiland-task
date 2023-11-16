///*
// 
// This is a default ViewController containing
// all the boilerplate code needed to set up a new ViewController.
// Add more methods and/or properties as per your specific needs.
// 
// */
//
//import UIKit
//
//class DefaultVC: BaseViewController {
//    
//    /*
//     
//     Add your views here
//     
//     */
//    lazy var navBar: NavigationBar = {
//        
//        let navbar = NavigationBar(showBackButton: true, titleText: "Attendance".localized())
//        navbar.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//        navbar.bellButton.addTarget(self, action: #selector(notificationsTapped), for: .touchUpInside)
//        return navbar
//        
//    }()
//
//    override func configure() {
//        
//        super.configure()
//        
//        view.addSubview(navBar)
//        hideKeyboardWhenTappedAround()
//    }
//    
//    override func setConstraints() {
//        super.setConstraints()
//        
//        navBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil,padding: .init(top: 0, left: 0, bottom: 0, right: 0),size: CGSize(width: view.width, height: view.width/8.2))
//        
//    }
//    
//    @objc private func backButtonTapped() {
//    
//        navigationController?.popViewController(animated: true)
//        
//    }
//    
//    @objc func notificationsTapped() {
//        
//        let vc = NotificationsVC()
//        navigationController?.pushViewController(vc, animated: true)
//        
//    }
//
//}
