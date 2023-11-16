//
//  PageControl.swift
//  Nounou
//
//  Created by Maaz on 16/10/23.
//

import Foundation
import UIKit
import Stevia


class PageControl: UIPageControl {
    
    init() {
        super.init(frame: .zero)
        semanticContentAttribute = isArabic ? .forceRightToLeft : .forceLeftToRight
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
