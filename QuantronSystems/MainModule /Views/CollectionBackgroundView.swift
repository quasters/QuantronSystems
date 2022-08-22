//
//  CollectionBackgroundView.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

class CollectionBackgroundView: UIView {
    public func configure() {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: LayoutCreator.shared.createMainCollectionLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.addSubview(collectionView)
        
        // MARK: - Add Constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor),
            collectionView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}

extension CollectionBackgroundView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if indexPath.row % 3 == 0 {
            cell.backgroundColor = .red
        } else if indexPath.row % 3 == 1 {
            cell.backgroundColor = .yellow
        } else if indexPath.row % 3 == 2 {
            cell.backgroundColor = .black
        }
        
        return cell
    }
    
}
