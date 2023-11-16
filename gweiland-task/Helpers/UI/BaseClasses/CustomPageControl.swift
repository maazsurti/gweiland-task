//
//  CustomPageControl.swift
//  Nounou
//
//  Created by RCD on 28/05/2023.
//

import Foundation
import UIKit

class CustomPageControl: UIPageControl {

    let dotRadius: CGFloat = 5.0
    let activeDotColor: UIColor = .red
    let inactiveDotColor: UIColor = .gray

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        // Calculate the size and position of each dot
        let dotWidth = dotRadius * 2
        let dotHeight = dotRadius * 2
        let spacing = dotWidth + 10 // Adjust the spacing between dots if needed

        let totalWidth = CGFloat(numberOfPages) * dotWidth + CGFloat(max(0, numberOfPages - 1)) * spacing
        let startX = (rect.width - totalWidth) / 2
        let startY = rect.height / 2 - dotHeight / 2

        // Draw each dot
        for i in 0..<numberOfPages {
            let dotRect = CGRect(x: startX + CGFloat(i) * (dotWidth + spacing), y: startY, width: dotWidth, height: dotHeight)
            let dotPath = UIBezierPath(roundedRect: dotRect, cornerRadius: dotRadius)

            if i == currentPage {
                activeDotColor.setFill()
            } else {
                inactiveDotColor.setFill()
            }

            dotPath.fill()
        }
    }
}
