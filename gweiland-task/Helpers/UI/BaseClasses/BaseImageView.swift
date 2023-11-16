//
//  BaseImageView.swift
//  Nounou
//
//  Created by RCD on 24/05/2023.
//

import Foundation
import UIKit

class BaseImageView: UIImageView {
    
    init(image: UIImage = UIImage(), contentMode: ContentMode = .scaleAspectFit, tintColor: UIColor? = nil, supportRTL: Bool = false){
        
        super.init(image: image)
        self.contentMode = contentMode
        
        if supportRTL {
            self.image = isArabic ? image.withHorizontallyFlippedOrientation() : image
        }
        
        self.clipsToBounds = true
        
        if let tintColor {
            self.tintColor = tintColor        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
