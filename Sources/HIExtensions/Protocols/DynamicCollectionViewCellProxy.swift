//
//  DynamicCollectionViewCellProxy.swift
//
//
//  Created by Mohamed Hamdouchi on 8/8/21.
//

import UIKit

public protocol DynamicCollectionViewCellProxy {
    func configureCell<T>(_ controller: T, collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
