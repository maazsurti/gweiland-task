//
//  BaseCollectionHeaderView.swift
//  Nounou
//
//  Created by RCD on 27/05/2023.
//

import Foundation
import UIKit
import Stevia

class BaseCollectionReusableView : UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    func configure() { }
    
    func setConstraints() {}
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
