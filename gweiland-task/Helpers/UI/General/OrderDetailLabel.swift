//
//  OrderDetailLabel.swift
//  Nounou
//
//  Created by Maaz on 17/10/23.
//

import Foundation
import UIKit
import Stevia


class OrderDetailLabel: UIView {
    
    let primaryLabel = Label(text: "Price:", font: .CustomFont(.bold, size: 17))
    
    let secondaryLabel = Label(text: "10.000 KWS", font: .CustomFont(.regular, size: 17))
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        subviews{
            
            primaryLabel
            secondaryLabel
        }
        
        primaryLabel.Top == Top
        primaryLabel.Leading == Leading
        primaryLabel.Bottom == Bottom
        
        secondaryLabel.Top == Top
        secondaryLabel.Trailing == Trailing
        secondaryLabel.Bottom == Bottom
    }
    
    convenience init(labelName: String, labelValue: String, color: UIColor = .black){
        self.init()
        
        primaryLabel.text = labelName.localized()
        secondaryLabel.text = labelValue.localized()
        
        primaryLabel.textColor = color
        secondaryLabel.textColor = color
    }
    
    func setValue(labelValue: String){
        
        secondaryLabel.text = labelValue
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let halfWidth = width/2
        
        primaryLabel.Trailing == Leading + (halfWidth - 8)
        secondaryLabel.Leading == Leading + (halfWidth + 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
