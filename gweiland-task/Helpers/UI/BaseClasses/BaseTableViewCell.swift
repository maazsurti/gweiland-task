//
//  BaseTableViewCell.swift
//  DiamondHouse
//
//  Created by RCD on 17/10/2022.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
