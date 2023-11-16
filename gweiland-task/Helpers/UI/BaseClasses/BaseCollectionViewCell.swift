//
//  BaseCollectionViewCell.swift
//  RCD1
//
//  Created by Maaz on 15/09/22.
//

import Foundation
import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        configure()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraints()
    }
    
    func configure() {
        
        
    }
    
    func setConstraints() {
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
