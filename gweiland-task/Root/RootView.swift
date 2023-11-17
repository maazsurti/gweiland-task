//
//  View.swift
//  gweiland-task
//
//  Created by Maaz on 16/11/23.
//

import Foundation
import UIKit
import Stevia

class RootView: BaseView {
    
    let navigationBar = NavigationBar()
    
    let searchBar = SearchBar(placeholderText: "Search Cryptocurrency")
    
    let filterButton = FilterButton()
    
    lazy var searchFilterStack = StackView(arrangedSubviews: [searchBar, filterButton], spacing: 9, axis: .horizontal)
    
    let categoryBar = CategoryBar()
    
    let banner = Banner()
    
    let currencyTV = CurrencyTV()
    
    let tabBar = TabBar()
    
    override func configure() {
        super.configure()
        
        subviews{
            tabBar
            navigationBar
            searchFilterStack
            categoryBar
            banner
            currencyTV
        }
        
        navigationBar.Top == safeAreaLayoutGuide.Top + 46
        navigationBar.Leading == Leading + leadingSpacing
        navigationBar.Trailing == Trailing - trailingSpacing
        
        searchFilterStack.Top == navigationBar.Bottom + 25
        searchFilterStack.Leading == navigationBar.Leading
        searchFilterStack.Trailing == navigationBar.Trailing
        
        categoryBar.Top == searchFilterStack.Bottom + 22
        categoryBar.Leading == navigationBar.Leading + 2
        categoryBar.Trailing == navigationBar.Trailing - 2
        
        banner.Top == categoryBar.Bottom + 15
        banner.Leading == navigationBar.Leading
        banner.Trailing == navigationBar.Trailing
        
        currencyTV.Top == banner.Bottom + 20
        currencyTV.Leading == navigationBar.Leading
        currencyTV.Trailing == navigationBar.Trailing
        currencyTV.Bottom == tabBar.Top - 13
        
        tabBar.Leading == Leading + 13
        tabBar.Trailing == Trailing - 13
        tabBar.Bottom == safeAreaLayoutGuide.Bottom - 25
    }
}
