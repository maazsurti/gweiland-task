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
    
    lazy var stack = StackView(arrangedSubviews: [tabItem1, tabItem2, globeButton, tabItem3, tabItem4], spacing: 16, axis: .horizontal, distribution: .fillEqually, alignment: .center)
    
    let globeButton = Button(image: .globe, makeImageScaleToFit: true)
    
    override func configure() {
        super.configure()
        
        self.backgroundColor = .tabBar
        self.borderRadius = 25
        
        tabItem2.isCurrentTab = true
        
        subviews{
            stack
        }
        
        stack.Leading == Leading + 30
        stack.Top == Top + 9
        stack.Bottom == Bottom - 9
        stack.Trailing == Trailing - 30
    
        globeButton.size(54)
        
    }
}
