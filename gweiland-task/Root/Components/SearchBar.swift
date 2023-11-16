//
//  SearchBar.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit
import Stevia


class SearchBar: BaseView {
    
    var searchField: TextField?
    
    let searchIcon = BaseImageView(image: .magnifyingGlass)
    
    init(placeholderText: String){
        super.init(frame: .zero)
        
        self.backgroundColor = .textFieldBackground
        
        searchField = TextField(placeholderString: placeholderText, placeholderFont: .CustomFont(.medium, size: 12), placeholderTextColor: .placeholder, insets: .zero)
        
        guard let searchField else {
            return
        }
        
        subviews{
            searchIcon
            searchField
        }
        
        searchIcon.size(12)
        searchIcon.CenterY == self.CenterY
        searchIcon.Leading == Leading + 23
        
        searchField.Top == Top + 12
        searchField.Leading == searchIcon.Trailing + 11
        searchField.Trailing == Trailing - 23
        searchField.Bottom == Bottom - 12
        
    }
    
    override func layoutSubviews() {
        
        self.borderRadius = height/2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
