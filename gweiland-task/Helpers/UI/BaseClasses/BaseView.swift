//
//  BaseView.swift
//  Reflex
//
//  Created by Maaz on 28/09/22.
//

import Foundation
import UIKit

class BaseView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    func configure() {
        
        backgroundColor = .white
    }
    
    func setConstraints() {
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
