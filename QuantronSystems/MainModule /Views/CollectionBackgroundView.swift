//
//  CollectionBackgroundView.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

class CollectionBackgroundView: UIView {
    private var collectionView: UICollectionView?
    
    var items: MainModel? {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    public func configure() {
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
        
        let urlString = "https://image.tmdb.org/t/p/original\(item.poster_path ?? "0")"
        cell.configure(imageURLString: urlString, title: item.title ?? item.name ?? "Unknown")
        
        return cell
    }
    
}