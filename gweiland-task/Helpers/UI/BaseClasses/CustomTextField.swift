////
////  CustomTextField.swift
////  Nounou
////
////  Created by RCD on 04/06/2023.
////
//
//import Foundation
//import Stevia
//import UIKit
//
//
//class CustomTextField: UIView{
//    
//    let textField = UITextField()
//    
//    let arrowIcon = BaseImageView(image: dropdownArrowIcon)
//    
//    var text: String? {
//        
//        get{ textField.text }
//        set{ textField.text = newValue}
//    }
//    
//    var isEnabled: Bool{
//        
//        get {textField.isEnabled }
//        set{
//            if !newValue{
//                
//                textField.tintColor = .clear
//                textField.isUserInteractionEnabled = false
//                
//            }  else {
//                
//                textField.tintColor = .black
//                textField.isUserInteractionEnabled = true
//            }
//        }
//    }
//
//    private let verticalPadding: CGFloat = 22
//    
//    override var intrinsicContentSize: CGSize {
//        var contentSize = super.intrinsicContentSize
//        contentSize.height += verticalPadding * 2
//        return contentSize
//    }
//    
//    convenience init(placeholderText: String = "",
//                     attributedPlaceholderString: NSMutableAttributedString? = nil,
//                     placeholderTextFont: UIFont? = .CustomFont(.regular, size: 14),
//                     placeholderTextColor: UIColor = .gray,
//                     backgroundColor: UIColor = .fieldsGray,
//                     isPickerField: Bool = false) {
//        
//        self.init(frame: .zero)
//        
//        textField.attributedPlaceholder = attributedPlaceholderString
//        
//        textField.textAlignment = isArabic ? .right : .left
//        
//        textField.font = .CustomFont(.regular, size: 15)
//        
//        textField.textColor = .darkText
//        
//        self.backgroundColor = backgroundColor
//        
//        if isPickerField  {
//            textField.tintColor = .clear
//        }
//        
//        if !placeholderText.isEmpty {
//            
//            let attributes = [NSAttributedString.Key.foregroundColor: placeholderTextColor, .font : placeholderTextFont]
//            let attributedPlaceholder = NSAttributedString(string: placeholderText.localized(), attributes: attributes as [NSAttributedString.Key : Any])
//            textField.attributedPlaceholder = attributedPlaceholder
//            
//        }
//        
//        self.backgroundColor = .fieldsGray
//        
//        subviews{
//            
//            textField
//        }
//        
//        if isPickerField {
//            showArrowIcon()
//            
//        } else {
//            
//            textField.Trailing == Trailing - defaultSpacing * 2
//        }
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        textField.Top == defaultSpacing
//        textField.Leading == Leading + defaultSpacing * 2
//        textField.Trailing == arrowIcon.Leading - defaultSpacing * 0.5
//        textField.Bottom == Bottom - defaultSpacing
//        
//        borderRadius = height/2
//    }
//    
//    func showArrowIcon(){
//        
//        subviews{
//            arrowIcon
//        }
//        
//        arrowIcon.Trailing == Trailing - 16
//        arrowIcon.centerVertically()
//        arrowIcon.size(15)
//    }
//    
//}
//
