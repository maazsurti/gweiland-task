//import UIKit
//import Foundation
//import Stevia
//
//class MyAlert {
//    
//    static let shared = MyAlert()
//    
//    let toAlpha: CGFloat = 0.4
//    
//    let window = UIApplication.shared.windows.first
//    let screen = UIScreen.main.bounds
//    
//    var targetView: UIView?
//    
//    lazy var okButton: UIButton = {
//        
//        lazy var button = UIButton()
//        button.setTitleColor(.white, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Ok".localized(), for: .normal)
//        button.titleLabel?.font = .CustomFont(.bold, size: 15)
//        button.backgroundColor = .primary
//        return button
//        
//    }()
//    
//    private let blurView: UIView = {
//        
//        let blurEffect = UIBlurEffect(style: .regular)
//        let visualEffectView = UIVisualEffectView(effect: blurEffect)
//        visualEffectView.alpha = 0
//        return visualEffectView
//        
//    }()
//    
//    private let messageLabel: UILabel = {
//        
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.font = .CustomFont(.regular, size: 15)
//        label.textColor = .darkGray
//        return label
//        
//    }()
//    
//    lazy var buttonStack: UIStackView = {
//        
//        let stackView = UIStackView()
//        stackView.addArrangedSubview(yesButton)
//        stackView.addArrangedSubview(noButton)
//        stackView.spacing = 10
//        stackView.axis = .horizontal
//        stackView.distribution = .equalCentering
//        return stackView
//        
//    }()
//    
//    lazy var yesButton = createButton(title: "Yes")
//    
//    lazy var noButton = createButton(title: "No")
//    
//    lazy var sendButton = Button(title: "Send", titleColor: .white, font: .CustomFont(.bold, size: 16), backgroundColor: primary, padding: .init(top: 8, left: 0, bottom: 8, right: 0))
//    
//    lazy var cancelButton = Button(title: "Cancel", titleColor: primary, font: .CustomFont(.bold, size: 16), backgroundColor: .white, borderColor: primary, borderWidth: 0.7, padding: .init(top: 6, left: 0, bottom: 6, right: 0))
//    
//    lazy var buttonStackView = StackView(arrangedSubviews: [sendButton, cancelButton], spacing: defaultSpacing, axis: .horizontal, distribution: .fillEqually)
//
//    private let backgroundView: UIView = {
//        
//        let view = UIView()
//        view.backgroundColor = .black.withAlphaComponent(0.4)
//        //view.translatesAutoresizingMaskIntoConstraints = false
//        view.alpha = 0
//        return view
//        
//    }()
//    
//    private let alertView: UIView = {
//        
//        let view = UIView()
//        view.layer.masksToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOffset = CGSize(width: 0, height: 0)
//        view.layer.shadowOpacity = 0.7
//        view.layer.shadowRadius = 15
//        view.layer.cornerRadius = 5
//        
//        view.alpha = 0
//        return view
//        
//    }()
//    
//    init(){
//        
//    }
//    
//    func showConfirmationAlert(confirmationTitle: String = "Yes", cancellationTitle: String = "No", with message: String? = nil, attributedString: NSAttributedString? = nil, handler: (() -> Void)? = nil) {
//        
//        yesButton.setTitle(confirmationTitle.localized(), for: .normal)
//        noButton.setTitle(cancellationTitle.localized(), for: .normal)
//        
//        guard let window = self.window else { return }
//        
//        backgroundView.frame = screen
//        window.addSubview(backgroundView)
//        
//        backgroundView.addSubview(alertView)
//        
//
//        alertView.centerToX()
//        alertView.centerToY()
//        alertView.setWidth(window.width/1.2)
//        alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 160).isActive = true
//        
//        alertView.addSubview(messageLabel)
//        messageLabel.centerToX()
//        messageLabel.setWidth(window.width/1.6)
//        messageLabel.anchor(top: alertView.topAnchor, leading: nil, trailing: nil, bottom: nil, padding: .init(top: 40, left: 0, bottom: 0, right: 0))
//        
////        backgroundView.addSubview(blurView)
////        blurView.frame = backgroundView.bounds
////        backgroundView.sendSubviewToBack(blurView)
//       // alertView.sendSubviewToBack(blurView)
//        
//        yesButton.setWidth(120)
//        noButton.setWidth(120)
//        alertView.addSubview(buttonStack)
//        buttonStack.anchor(top: messageLabel.bottomAnchor, leading: nil, trailing: nil, bottom: alertView.bottomAnchor, padding: .init(top: 20, left: 0, bottom: 40, right: 0), size: CGSize(width: 260, height: 35))
//        buttonStack.centerToX()
//        
//        yesButton.addAction(UIAction(
//          identifier: .init("yesButton"),
//          handler: { [weak self] _ in
//              
//              self?.dismissAlert()
//              handler?()
//          }),
//        for: .touchUpInside)
//        
//        noButton.addAction(UIAction(
//          identifier: .init("noButton"),
//          handler: {  _ in
//                    self.dismissAlert()
//                }),
//        for: .touchUpInside)
//        
//        if let message {
//            messageLabel.text = message.localized()
//        }
//        
//        if let attributedString {
//            messageLabel.attributedText = attributedString
//        }
//        
//        doAnimation()
//        
//    }
//    
//    func showAlert(with message: String, onDismiss: (()-> Void)? = nil)  {
//    
//
//        guard let window = self.window else { return }
//
//        backgroundView.frame = screen
//        window.addSubview(backgroundView)
//
//        backgroundView.addSubview(alertView)
//
//        alertView.centerToX()
//        alertView.centerToY()
//        alertView.setWidth(window.width/1.3)
//        alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
//
//        alertView.addSubview(messageLabel)
//        messageLabel.centerToX()
//        messageLabel.setWidth(window.width/1.6)
//        messageLabel.anchor(top: alertView.topAnchor, leading: nil, trailing: nil, bottom: nil, padding: .init(top: 35, left: 0, bottom: 0, right: 0))
//        messageLabel.font = .CustomFont(.regular, size: 16)
//
//        alertView.addSubview(okButton)
//        okButton.anchor(top: messageLabel.bottomAnchor, leading: nil, trailing: nil, bottom: alertView.bottomAnchor, padding: .init(top: 15, left: 0, bottom: 25, right: 0), size: CGSize(width: 90, height: 35))
//        okButton.centerToX()
//        okButton.titleLabel?.font = .CustomFont(.bold, size: 16)
//        
//        okButton.addAction(UIAction(
//          identifier: .init("OkButton"),
//          handler: { _ in
//                    onDismiss?()
//                    self.dismissAlert()
//                }),
//        for: .touchUpInside)
//
//        messageLabel.text = message.localized()
//
//        doAnimation()
//        
//    }
//    
//    
//    
//    @objc func dismissAlert() {
//        
//        UIView.animate(withDuration: 0.2, animations: { [weak self] in
//            
//            self?.backgroundView.alpha = 0
//            
//        }, completion: { [weak self] done in
//            
//            if done {
//                
//                UIView.animate(withDuration: 0.15, animations: { [weak self] in
//                    
//                    self?.alertView.alpha = 0
//                })
//                
//                self?.yesButton.removeAction(identifiedBy: .init("yesButton"), for: .touchUpInside)
//                self?.noButton.removeAction(identifiedBy: .init("noButton"), for: .touchUpInside)
//                self?.okButton.removeAction(identifiedBy: .init("okButton"), for: .touchUpInside)
//                
//                self?.backgroundView.removeFromSuperview()
//            }
//        })
//        
//    }
//    
//    func createButton(title: String) -> UIButton {
//        
//        let button = UIButton()
//        button.setTitle(title.localized(), for: .normal)
//        button.titleLabel?.font = .CustomFont(.bold, size: 16)
//        button.backgroundColor = primary
//        button.setTitleColor(.white, for: .normal)
//        return button
//    }
//    
//    func doAnimation() {
//        
//        UIView.animate(withDuration: 0.1, animations: { [weak self] in
//            
//            guard let self else { return }
//
//            self.backgroundView.alpha = 1
//            //self?.blurView.alpha = 1
//            
//        }, completion: { [weak self] completed in
//            
//            if completed {
//                
//                UIView.animate(withDuration: 0.15, animations: { [weak self] in
//                    
//                     guard let self else { return }
//                    
//                    self.alertView.alpha = 1
//                    self.alertView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
//                })
//            }
//        })
//    }
//    
//    func showAlertWithTextField(placeholderText: String, alertTitle: String, sendAction: ((String) -> Void)? = nil){
//        
//        guard let window = self.window else { return }
//        
//        let titleLabel = Label(text: alertTitle, textColor: primary, font: .CustomFont(.bold, size: 18))
//        
//        let textField = TextField(placeholderString: placeholderText, placeholderFont: .CustomFont(.regular, size: 16), placeholderTextColor: .gray, textFont: .CustomFont(.regular, size: 17), borderColor: .darkGray, borderWidth: 0.7, insets: .init(top: 12, left: 20, bottom: 12, right: 20))
//        
//        window.subviews{
//            backgroundView
//        }
//        
//        backgroundView.subviews{
//            alertView
//        }
//        
//        alertView.subviews{
//            buttonStackView
//            titleLabel
//            textField
//        }
//        
//        backgroundView.fillContainer()
//        
//        titleLabel.Top == alertView.Top + defaultSpacing * 3
//        titleLabel.centerHorizontally()
//        
//        textField.Top == titleLabel.Bottom + defaultSpacing * 2
//        textField.Leading == alertView.Leading + defaultSpacing * 4
//        textField.Trailing == alertView.Trailing - defaultSpacing * 4
//        
//        buttonStack.Top == textField.Bottom + defaultSpacing * 2
//        buttonStackView.Bottom == alertView.Bottom - defaultSpacing * 3
//        buttonStackView.Leading == textField.Leading
//        buttonStackView.Trailing == textField.Trailing
//        
//        alertView.setWidth(window.width/1.1)
//        alertView.Height >= 205
//        alertView.centerVertically()
//        alertView.centerHorizontally()
//        
//        cancelButton.addAction(UIAction(
//          identifier: .init("cancelButton"),
//          handler: { _ in
//                    self.dismissAlert()
//                }),
//        for: .touchUpInside)
//        
//        sendButton.addAction(UIAction(
//          identifier: .init("sendButton"),
//          handler: { _ in
//              guard let textFieldString = textField.text else {return}
//              sendAction?(textFieldString)
//              self.dismissAlert()
//                }),
//        for: .touchUpInside)
//        
//        doAnimation()
//    }
//    
//    
//}
//
//class Alerts {
//    
//    static func showConfirmationAlert(confirmationTitle: String = "Yes", cancellationTitle: String = "No", with message: String, onDismiss: (() -> Void)? = nil) {
//        
//        let alert = MyAlert()
//        alert.showConfirmationAlert(confirmationTitle: confirmationTitle, cancellationTitle: cancellationTitle, with: message, handler: onDismiss)
//    }
//    
//    static func showAlert(with message: String?, onDismiss:  (() -> Void)? = nil) {
//        
//        let alert = MyAlert()
//        alert.showAlert(with: message ?? "", onDismiss: onDismiss)
//    }
//    
//    static func showAlertWithTextField(placeholderText: String, alertTitle: String, sendAction: ((String) -> Void)? = nil){
//        
//        let alert = MyAlert()
//        alert.showAlertWithTextField(placeholderText: placeholderText, alertTitle: alertTitle, sendAction: sendAction)
//    }
//}
