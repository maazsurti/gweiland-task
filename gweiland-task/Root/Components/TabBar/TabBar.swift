//
//  TabBar.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit
import Stevia


class TabBar: BaseView {
    
    let tabItem1 = TabBarItem(itemImage: .eShop, itemTitle: "€-$hop")
    
    let tabItem2 = TabBarItem(itemImage: .exchange, itemTitle: "Exchange")
    
    let tabItem3 = TabBarItem(itemImage: .launchpads, itemTitle: "Launchpads")
    
    let tabItem4 = TabBarItem(itemImage: .wallet, itemTitle: "Wallet")
    
    let globeButton = Button(image: .globe, makeImageScaleToFit: true)
    
    override func configure() {
        super.configure()
        
        self.backgroundColor = .tabBar
        self.borderRadius = 25
        
        tabItem2.isCurrentTab = true
        
        subviews{
            tabItem1
            tabItem2
            globeButton
            tabItem3
            tabItem4
        }
        
        tabItem1.Leading == Leading + 30
        tabItem1.centerVertically()
        
        tabItem2.Leading == tabItem1.Trailing + 16
        tabItem2.centerVertically()
        
        globeButton.Leading == tabItem2.Trailing + 14
        globeButton.Top == Top + 9
        globeButton.Bottom == Bottom - 9
        globeButton.centerVertically()
        globeButton.size(54)
        
        tabItem3.Leading == globeButton.Trailing + 14
        tabItem3.centerVertically()
        
        tabItem4.Leading == tabItem3.Trailing + 16
        tabItem4.Trailing == Trailing - 30
        tabItem4.centerVertically()
        
    }
}
