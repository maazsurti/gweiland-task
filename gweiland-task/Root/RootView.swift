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
    
    override func configure() {
        super.configure()
        
        subviews{
            navigationBar
            searchFilterStack
        }
        
        navigationBar.Top == safeAreaLayoutGuide.Top + 46
        navigationBar.Leading == Leading + leadingPadding
        navigationBar.Trailing == Trailing - trailingPadding
        
        searchFilterStack.Top == navigationBar.Bottom + 25
        searchFilterStack.Leading == navigationBar.Leading
        searchFilterStack.Trailing == navigationBar.Trailing
        
    }
}
