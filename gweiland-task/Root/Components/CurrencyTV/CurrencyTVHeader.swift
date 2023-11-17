//
//  CurrencyTVHeader.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit
import Stevia

class CurrencyTVHeader: UITableViewHeaderFooterView {
    
    let identifier = "CurrencyTVHeader"
    
    let headerLabel = Label(text: "Top Cryptocurrencies", font: .CustomFont(.medium, size: 18))
    
    let viewAllButton = Button(title: "View All", titleColor: .viewAll, font: .CustomFont(.medium, size: 13))
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        subviews{
            headerLabel
            viewAllButton
        }
        
        headerLabel.Leading == Leading
        headerLabel.Top == Top
        headerLabel.Bottom == Bottom
        
        viewAllButton.Top == headerLabel.Top
        viewAllButton.Trailing == Trailing
        headerLabel.Bottom == headerLabel.Bottom
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
