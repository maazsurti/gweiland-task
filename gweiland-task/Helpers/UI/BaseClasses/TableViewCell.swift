//
//  TableViewCell.swift
//  DiamondHouse
//
//  Created by RCD on 28/11/2022.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    func configure() {
        
        
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
