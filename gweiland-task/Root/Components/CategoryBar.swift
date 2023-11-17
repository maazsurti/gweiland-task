//
//  CategoryBar.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit
import Stevia

class CategoryBar: BaseView {
    
    let category1Label = Label(text: "Cryptocurrency", font: .CustomFont(.semiBold, size: 20))
    
    let category2Label = Label(text: "NFTs", textColor: .placeholder, font: .CustomFont(.semiBold, size: 20))
    
    override func configure() {
        super.configure()
        
        subviews{
            category1Label
            category2Label
        }
        
        category1Label.Leading == Leading
        category1Label.Top == Top
        category1Label.Bottom == Bottom
        
        category2Label.Top == category1Label.Top
        category2Label.Leading == category1Label.Trailing + 20
        category2Label.Trailing == Trailing
        category1Label.Bottom == category1Label.Bottom
    }
}
