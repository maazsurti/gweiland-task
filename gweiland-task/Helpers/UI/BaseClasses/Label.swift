//
//  Label.swift
//  DiamondHouse
//
//  Created by RCD on 13/10/2022.
//

import Foundation
import UIKit

class Label: UILabel {
    
    var insets: UIEdgeInsets
    
    init(text: String = "", attributedText: NSAttributedString? = nil, textColor: UIColor = .darkText, font: UIFont = .CustomFont(), alignment: NSTextAlignment = isArabic ? .right : .left, numberOfLines: Int = 0, insets: UIEdgeInsets = .zero, borderRadius: CGFloat = 0) {
        self.insets = insets
        super.init(frame: .zero)
        self.text = text.localized()
        self.textColor = textColor
        self.font = font
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.cornerRadius = borderRadius
        
//        setContentCompressionResistancePriority(.required, for: .horizontal)
//        setContentCompressionResistancePriority(.required, for: .vertical)
        
        if let attributedText{
            
            self.attributedText = attributedText
        }

        
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += insets.left + insets.right
        size.height += insets.top + insets.bottom
        return size
    }
    
       
       // Border radius for the label
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
