//
//  CollectionBackgroundView.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

class CollectionBackgroundView: UIView {
    private var collectionView: UICollectionView?

    public var items: MovieList? {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    public func configure() {
        self.isUserInteractionEnabled = true
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: LayoutCreator.shared.createMainCollectionLayout())
        guard let collectionView = collectionView else { return }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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
        return items?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainCollectionViewCell,
              let item = items?.results?[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.item = item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items?.results?[indexPath.row]
        let dictionary = ["id": item?.id]
        NotificationCenter.default.post(name: NSNotification.Name("showInfo"), object: nil, userInfo: dictionary as [AnyHashable : Any])
    }
}
