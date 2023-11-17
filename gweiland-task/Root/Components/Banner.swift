//
//  Banner.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit
import Stevia


class Banner: BaseView {
    
    let bannerCurveView = ScaleAspectFitImageView(image: .bannerCurve)
    
    let currencyAbvLabel = Label(text: "BTC", font: .CustomFont(.bold, size: 18))
    
    let currencyLabel = Label(text: "Bitcoin", font: .CustomFont(.medium, size: 13))
    
    let currencyImage = BaseImageView(image: .currency)
    
    let currencyValueLabel = Label(text: "$55,000 USD", font: .CustomFont(.bold, size: 16), alignment: .right)
    
    let valueChangePercentLabel = Label(text: "+2.5%", textColor: .positive, font: .CustomFont(.bold, size: 13), alignment: .right)
    
    override func configure() {
        super.configure()
        
        self.backgroundColor = .banner
        self.borderRadius = 20
        
        subviews {
            bannerCurveView
            currencyImage
            currencyAbvLabel
            currencyLabel
            currencyValueLabel
            valueChangePercentLabel
        }
        
        currencyImage.size(47)
        currencyImage.Top == Top + 26
        currencyImage.Leading == Leading + 20
        
        currencyAbvLabel.Top == currencyImage.Top + 2
        currencyAbvLabel.Leading == currencyImage.Trailing + 14
        
        currencyLabel.Bottom == currencyImage.Bottom - 2
        currencyLabel.Leading == currencyAbvLabel.Leading
        
        currencyValueLabel.Top == currencyImage.Top + 4
        currencyValueLabel.Trailing == Trailing - 20
        
        valueChangePercentLabel.Bottom == currencyImage.Bottom - 2
        valueChangePercentLabel.Trailing == currencyValueLabel.Trailing
        
        bannerCurveView.Top == currencyImage.Bottom + 6
        bannerCurveView.Bottom == Bottom
        bannerCurveView.Leading == Leading
        bannerCurveView.Trailing == Trailing
      //  bannerCurveView.Height == 52.5
    }
    
    func configure(with model: Cryptocurrency?){
        
        guard let model else {
            printError(with: "model is empty")
            return
        }
    
        let twentyFourHourChangePercentage = (model.quote?.usd?.percentChange24H?.rounded(toPlaces: 2) ?? 0.0)
        let isChangePositive = twentyFourHourChangePercentage > 0
        let isNoChange = twentyFourHourChangePercentage == 0
        
        currencyAbvLabel.text = model.symbol
        currencyLabel.text = model.name
        currencyValueLabel.text = "$\((model.quote?.usd?.price?.rounded(toPlaces: 2) ?? 0.0)) USD"
        valueChangePercentLabel.text = "\(isChangePositive ? "+" : "")" + "\(twentyFourHourChangePercentage) %"
        valueChangePercentLabel.textColor = isNoChange ? .black : isChangePositive ? .positive : .negative

    }
}
