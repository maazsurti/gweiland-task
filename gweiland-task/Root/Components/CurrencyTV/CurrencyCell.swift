//
//  CurrencyCell.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit
import Stevia

class CurrencyCell: TableViewCell {
    
    static let identifier = "CurrencyCell"
    
    let currencyAbvLabel = Label(text: "BTC", font: .CustomFont(.bold, size: 18))
    
    let currencyLabel = Label(text: "Bitcoin", font: .CustomFont(.medium, size: 13))
    
    let currencyImage = BaseImageView(image: .currency)
    
    let currencyValueLabel = Label(text: "$55,000 USD", font: .CustomFont(.bold, size: 16), alignment: .right)
    
    let valueChangePercentLabel = Label(text: "+2.5%", textColor: .positive, font: .CustomFont(.medium, size: 13), alignment: .right)
    
    let graphIcon = ScaleAspectFitImageView(image: .negativeGraph)
    
    override func configure() {
        super.configure()
        
        self.backgroundColor = .banner
        self.selectionStyle = .none
        
        subviews {
            currencyImage
            currencyAbvLabel
            currencyLabel
            currencyValueLabel
            valueChangePercentLabel
            graphIcon
        }
        
        currencyImage.size(47)
        currencyImage.Top == contentView.Top
        currencyImage.Leading == Leading
        currencyImage.Bottom == contentView.Bottom - 20
        
        currencyAbvLabel.Top == currencyImage.Top + 2
        currencyAbvLabel.Leading == currencyImage.Trailing + 14
        
        currencyLabel.Bottom == currencyImage.Bottom - 2
        currencyLabel.Leading == currencyAbvLabel.Leading
        
        currencyValueLabel.Top == currencyImage.Top + 4
        currencyValueLabel.Trailing == Trailing
        
        valueChangePercentLabel.Bottom == currencyImage.Bottom - 2
        valueChangePercentLabel.Trailing == currencyValueLabel.Trailing

        graphIcon.Top == currencyImage.Top
        graphIcon.Leading == currencyAbvLabel.Trailing + 15
        graphIcon.Width == 64
    }
}
