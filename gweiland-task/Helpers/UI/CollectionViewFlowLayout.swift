//
//  CollectionViewFlowLayout.swift
//  Nounou
//
//  Created by Maaz on 06/09/23.
//

import Foundation
import UIKit


enum CollectionDisplay {
    case inline
    case squareInline
    case list
    case grid
    case mPackage
    case plans
    case banner
    case menugrid
}

class CollectionViewFlowLayout : UICollectionViewFlowLayout {
    
    var display : CollectionDisplay = .grid {
        didSet {
            if display != oldValue {
                self.invalidateLayout()
            }
        }
    }

    private var columns: CGFloat = 1
    
    
    
    convenience init(display: CollectionDisplay, columns: CGFloat = 1, minimumLineSpacing: CGFloat = 0, minimumInteritemSpacing: CGFloat = 0) {
        self.init()
        self.columns = columns
        self.display = display
        self.minimumLineSpacing = minimumLineSpacing //10
        self.minimumInteritemSpacing = minimumInteritemSpacing //10
        
        self.configLayout()
    }
    
    func configLayout() {
        switch display {
        case .inline:
            self.scrollDirection = .horizontal
            if let collectionView = self.collectionView {
                self.itemSize = CGSize(width: (100), height: collectionView.frame.height)
            }
            
        case .squareInline:
            self.scrollDirection = .horizontal
            if let collectionView = self.collectionView {
                self.itemSize = CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
            }
        case .menugrid:
            self.scrollDirection = .vertical
            if let collectionView = self.collectionView {
                self.itemSize = CGSize(width: collectionView.frame.width/2, height: collectionView.frame.width/2)
            }
            
        case .banner:
            self.scrollDirection = .horizontal
            if let collectionView = self.collectionView {
                self.itemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            }
            
        case .grid:
            self.scrollDirection = .vertical
            if let collectionView = self.collectionView {
                let optimisedWidth = (collectionView.frame.width - minimumInteritemSpacing) / columns
                self.itemSize = CGSize(width: optimisedWidth , height: optimisedWidth + 90)
            }
            
        case .mPackage:
            self.scrollDirection = .vertical
            if let collectionView = self.collectionView {
                let optimisedWidth = (collectionView.frame.width - minimumInteritemSpacing) / columns
                self.itemSize = CGSize(width: optimisedWidth , height: collectionView.frame.height / 3)
            }
            
        case .plans:
            self.scrollDirection = .vertical
            if let collectionView = self.collectionView {
                let optimisedWidth = (collectionView.frame.width - (minimumInteritemSpacing * 2)) / columns
                self.itemSize = CGSize(width: optimisedWidth , height: collectionView.frame.height / 3)
            }
            
        case .list:
            self.scrollDirection = .vertical
            if let collectionView = self.collectionView {
                self.itemSize = CGSize(width: collectionView.frame.width , height: collectionView.frame.height * 0.45)
            }
        }
    }
    
    override func invalidateLayout() {
        super.invalidateLayout()
        self.configLayout()
    }
    
}
