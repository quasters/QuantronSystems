//
//  LayoutCreator.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

class LayoutCreator {
    static let shared = LayoutCreator()
    private init(){}
    
    func createMainCollectionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let trailingItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                          heightDimension: .fractionalHeight(1.0))
            let trailingItem = NSCollectionLayoutItem(layoutSize: trailingItemSize)
            
            let trailingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                           heightDimension: .fractionalHeight(0.5))
            let trailingGroup = NSCollectionLayoutGroup.horizontal(layoutSize: trailingGroupSize, subitem: trailingItem, count: 2)
            
            let section = NSCollectionLayoutSection(group: trailingGroup)
            
            return section
            
        }
        return layout
    }
}
