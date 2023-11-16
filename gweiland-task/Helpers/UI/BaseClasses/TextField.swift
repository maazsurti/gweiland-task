//
//  TextField.swift
//  DiamondHouse
//
//  Created by RCD on 13/10/2022.
//

import Foundation
import UIKit

class TextField: UITextField, UITextFieldDelegate {
    
    var insets = UIEdgeInsets()
    
    init(insets: UIEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)) {
        
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.insets = insets
        leftViewMode = .always
        delegate = self
        
    }

    init(placeholderString: String = "",
         placeholderFont: UIFont = .CustomFont(),
         placeholderTextColor: UIColor = .darkText,
         placeholderTextAlignment: NSTextAlignment = isArabic ? .right : .left,
         attributedPlaceholderString: NSMutableAttributedString? = nil,
         textFont: UIFont = .CustomFont(),
         borderColor: UIColor = .primary,
         borderWidth: CGFloat = 0.0,
         textColor: UIColor = .darkText,
         backgroundColor: UIColor = .clear,
         textAlignment: NSTextAlignment = isArabic ? .right : .left,
         isPassword: Bool = false,
         insets: UIEdgeInsets = UIEdgeInsets(top: defaultSpacing, left: 20, bottom: defaultSpacing, right: 20)
        ){
        
        super.init(frame: .zero)

        setBorder(borderWidth: borderWidth, borderColor: borderColor)
        
        self.insets = insets
        
        self.textColor = textColor
        
        self.font = textFont
        
        self.textAlignment = textAlignment
        
        self.attributedPlaceholder = attributedPlaceholderString
        
        self.isSecureTextEntry = isPassword
        
        self.backgroundColor = backgroundColor
        
        if !placeholderString.isEmpty {
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = placeholderTextAlignment
            
            let attributes = [NSAttributedString.Key.foregroundColor: placeholderTextColor, .font : placeholderFont,  .paragraphStyle: paragraphStyle]
            let attributedPlaceholder = NSAttributedString(string: placeholderString.localized(), attributes: attributes)
            self.attributedPlaceholder = attributedPlaceholder
            
        }
        
        self.tintColor = .black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        self.layer.cornerRadius = self.height/2
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: insets)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return  bounds.inset(by: insets)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
