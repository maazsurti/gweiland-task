//
//  CollectionVIew.swift
//  Nounou
//
//  Created by Maaz on 09/09/23.
//

import Foundation
import UIKit

class CollectionView: UICollectionView {

    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        let s = self.collectionViewLayout.collectionViewContentSize
        return CGSize(width: max(s.width, 1), height: max(s.height,1))
    }
}
