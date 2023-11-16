//
//  RTLSupportLayout.swift
//  Nounou
//
//  Created by Maaz on 16/10/23.
//

import Foundation
import UIKit
import Stevia


class RTLSupportLayout: UICollectionViewFlowLayout {
    
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return isArabic ? true : false
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
