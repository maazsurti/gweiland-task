//
//  NavigationBar.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit
import Stevia


class NavigationBar: BaseView {
    
    let headerLabel = Label(text: "EXCHANGES", font: .CustomFont(.semiBold, size: 20))
    
    let notificationButton = ButtonWithBadge(image: .bell)
    
    let settingsButton = Button(image: .cog, makeImageScaleToFit: true)
    
    override func configure() {
        super.configure()
        
        subviews{
            headerLabel
            notificationButton
            settingsButton
        }
        
        headerLabel.Top == Top
        headerLabel.Leading == Leading
        headerLabel.Bottom == Bottom
        
        settingsButton.Trailing == Trailing
        settingsButton.CenterY == CenterY
        settingsButton.size(20)
        
        notificationButton.Trailing == settingsButton.Leading - defaultSpacing * 2
        notificationButton.CenterY == CenterY
        
    }
}
