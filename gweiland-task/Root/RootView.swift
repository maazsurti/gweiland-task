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
    
    let label = Label(text: "TEsts label fjkdshdlfka", font: .CustomFont(.black, size: 20))
    
    override func configure() {
        super.configure()
        
        subviews{label}
        
        label.centerInContainer()
    }
}
