//
//  FilterButton.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit
import Stevia


class FilterButton: Button {
    
    let filterIcon = BaseImageView(image: .parallelLines)
    
    let filterLabel = Label(text: "Filter", textColor: .placeholder, font: .CustomFont(.medium, size: 13))
    
    
    init(){
        super.init()
        
        subviews{
            filterIcon
            filterLabel
        }
        
        filterLabel.Top == Top + 13
        filterLabel.Leading == filterIcon.Trailing + 3
        filterLabel.Trailing == Trailing - 13
        filterLabel.Bottom == Bottom - 13
        
        filterIcon.Top == filterLabel.Top + 4
        filterIcon.Bottom == filterLabel.Bottom - 4
        filterIcon.Leading == Leading + 13
        filterIcon.Width == Width * 0.2
        
        setBorder(borderWidth: 1, borderColor: .placeholder)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
