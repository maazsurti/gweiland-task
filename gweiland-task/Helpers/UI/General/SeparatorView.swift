//
//  SeparatorView.swift
//  Nounou
//
//  Created by Maaz on 13/10/23.
//

import Foundation
import UIKit
import Stevia


class SeparatorView: BaseView {
    
    let separator = UIView()
    
    init(color: UIColor = .black, height: CGFloat = 1.0) {
        super.init(frame: .zero)
        
        subviews{separator}
        
        separator.fillContainer()
        separator.backgroundColor = color
        separator.Height == height
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
