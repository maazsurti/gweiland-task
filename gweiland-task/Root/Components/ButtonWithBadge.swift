//
//  ButtonWithBadge.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit
import Stevia


class ButtonWithBadge: Button {
    
    let badgeIcon = BaseImageView(image: .badge)
    
    let buttonImage = BaseImageView(image: UIImage())
    
    init(image: UIImage){
        super.init()
        buttonImage.image = image
        
        subviews{
            badgeIcon
            buttonImage
        }
        
        buttonImage.Bottom == Bottom
        buttonImage.Leading == Leading
        buttonImage.size(20)
        buttonImage.Top == Top
    
        badgeIcon.size(9)
        badgeIcon.Trailing == Trailing
        badgeIcon.CenterX == buttonImage.Trailing - 2
        badgeIcon.Bottom == buttonImage.Top
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
