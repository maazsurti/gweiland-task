//
//  Spacer.swift
//  Nounou
//
//  Created by RCD on 04/06/2023.
//

import Foundation
import UIKit

let spacer: UIView = {
    
    let v = UIView()
    v.setContentCompressionResistancePriority(.required, for: .horizontal)
    v.setContentCompressionResistancePriority(.required, for: .vertical)
    return v
    
}()
