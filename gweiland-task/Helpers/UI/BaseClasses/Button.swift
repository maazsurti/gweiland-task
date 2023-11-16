//
//  Button.swift
//  Reflex
//
//  Created by Maaz on 26/09/22.
//

import Foundation
import UIKit

class Button: UIButton {
    
    var cornerRadius: CGFloat?
    
    private let verticalPadding: CGFloat = 8
    
    private var padding: UIEdgeInsets
    
    private let increaseTappableArea: Bool
    
    override var intrinsicContentSize: CGSize {
        let contentSize = super.intrinsicContentSize
        let paddedSize = CGSize(width: contentSize.width + padding.left + padding.right,
                                height: contentSize.height + padding.top + padding.bottom)
        return paddedSize
    }
    private var originalImage: UIImage?
    
    init(title: String? = nil,
         attributedTitle: NSAttributedString? = nil,
         titleColor: UIColor = .black,
         font: UIFont = .CustomFont(),
         backgroundColor: UIColor = .primary,
         borderColor: UIColor? = nil,
         borderWidth: CGFloat? = nil,
         cornerRadius : CGFloat? = nil,
         textAligment: ContentHorizontalAlignment = .center,
         image: UIImage? = nil,
         selectedImage: UIImage? = nil,
         padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
         increaseTappableArea: Bool = false,
         makeImageScaleToFit: Bool = false
         
      ) {
        
        self.padding = padding
        self.increaseTappableArea = increaseTappableArea
        
        super.init(frame: .zero)
        
        setTitle(title?.localized(), for: .normal)
        
        setTitleColor(titleColor, for: .normal)
        
        titleLabel?.font = font
        
        layer.borderColor = borderColor?.cgColor
        
        layer.borderWidth = borderWidth ?? 0
        
        titleEdgeInsets = padding
        
        contentHorizontalAlignment = textAligment
        
        self.backgroundColor = backgroundColor
        
        self.cornerRadius = cornerRadius
        
        setAttributedTitle(attributedTitle, for: .normal)
        
        self.setImage(image, for: .normal)
        
        self.setImage(selectedImage, for: .selected)
        
        if isArabic {
            
            self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        }
        
        if makeImageScaleToFit{
            self.makeButtonImageToScaleAspectFit()
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let cornerRadius {
            
            layer.cornerRadius = cornerRadius
            
        } else {
            
            layer.cornerRadius = height/2
        }
        
    }
    
    override var isHighlighted: Bool {
        
        didSet {
            
            if isHighlighted{
                
                if backgroundColor != .clear {
                    
                    self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.5)
                }
                
                
                self.subviews.forEach { subview in
                    subview.alpha =  0.5
                }
                
                guard let imageView = self.imageView else { return }
                
                imageView.alpha = 0.5
                
            } else {
                
                UIView.animate(withDuration: 0.2) {
                    self.subviews.forEach { subview in
                        subview.alpha =  1.0
                    }
                }
                
                UIView.animate(withDuration: 0.2) {
                    
                    if self.backgroundColor != .clear {
                        self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
                    }
                }
                
                guard let imageView = self.imageView else { return }
                
                UIView.animate(withDuration: 0.2) {
                    
                    imageView.alpha = 1
                }
                
            }
        }
    }
    
    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        super.setImage(image, for: state)
        originalImage = image
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if increaseTappableArea {
            let extendedArea = UIEdgeInsets(top: -20, left: -20, bottom: -20, right: -20)
            return bounds.inset(by: extendedArea).contains(point)
        }
        return super.point(inside: point, with: event)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
