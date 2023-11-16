//
//  StackView.swift
//  Nounou
//
//  Created by Maaz on 09/06/23.
//

import Foundation
import UIKit

class StackView: UIStackView {
    convenience init( arrangedSubviews: [UIView], spacing: CGFloat = 0.0, axis: NSLayoutConstraint.Axis = .vertical, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
}
