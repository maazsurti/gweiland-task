//
//  TabBarItem.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit
import Stevia


class TabBarItem: BaseView {
    
    let itemImageView = BaseImageView(image: UIImage())
    
    let itemTitleLabel = Label(textColor: .barItemUnselected ,font: .CustomFont(.semiBold, size: 10), alignment: .center)
    
    var isCurrentTab: Bool = false {
        didSet{
            setProperties()
        }
    }
    
    init(itemImage: UIImage, itemTitle: String){
        super.init(frame: .zero)
        
        itemTitleLabel.text = itemTitle
        itemImageView.image = itemImage
        
        setProperties()
        
        subviews{
            itemImageView
            itemTitleLabel
        }
        
        itemImageView.Top == Top
        itemImageView.centerHorizontally()
        itemImageView.size(20)
    
        itemTitleLabel.Top == itemImageView.Bottom + defaultSpacing
        itemTitleLabel.Bottom == Bottom
        itemTitleLabel.Leading == Leading
        itemTitleLabel.Trailing == Trailing
        
    }
    
    func setProperties(){
        
        itemImageView.tintColor = isCurrentTab ? .white : .barItemUnselected
        itemTitleLabel.textColor = isCurrentTab ? .white : .barItemUnselected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
