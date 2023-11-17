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
    
    let currencyImage = BaseImageView(image: .placeholder, contentMode: .scaleToFill)
    
    let currencyValueLabel = Label(text: "$55,000 USD", font: .CustomFont(.bold, size: 16), alignment: .right)
    
    let valueChangePercentLabel = Label(text: "+2.5%", textColor: .positive, font: .CustomFont(.medium, size: 13), alignment: .right)
    
    let graphIcon = ScaleAspectFitImageView(image: .negativeGraph)
    
    override func configure() {
        super.configure()

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
        currencyImage.borderRadius = 47/2
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
    
    func configure(with model: Cryptocurrency){
    
        let twentyFourHourChangePercentage = (model.quote?.usd?.percentChange24H?.rounded(toPlaces: 2) ?? 0.0)
        let isChangePositive = twentyFourHourChangePercentage > 0
        let isNoChange = twentyFourHourChangePercentage == 0
        
        currencyAbvLabel.text = model.symbol
        currencyLabel.text = model.name
        currencyValueLabel.text = "$\((model.quote?.usd?.price?.rounded(toPlaces: 2) ?? 0.0)) USD"
        valueChangePercentLabel.text = "\(isChangePositive ? "+" : "")" + "\(twentyFourHourChangePercentage) %"
        valueChangePercentLabel.textColor = isNoChange ? .black : isChangePositive ? .positive : .negative
        graphIcon.image = isChangePositive ? .positiveGraph : .negativeGraph

    }
}

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
