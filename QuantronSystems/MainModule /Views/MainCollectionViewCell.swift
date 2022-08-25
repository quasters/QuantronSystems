//
//  MainCollectionViewCell.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 23.08.2022.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    var posterImageView = CachedImageView()
    private var titleLabel = UILabel()
    
    var item: Movie? {
        didSet {
            let urlString = "https://image.tmdb.org/t/p/original\(item?.poster_path ?? "0")"
            posterImageView.loadImage(urlString: urlString)
            posterImageView.contentMode = .scaleToFill
            
            titleLabel.text = item?.title ?? item?.name ?? "Unknown"
            titleLabel.font = UIFont.systemFont(ofSize: 13)
            titleLabel.numberOfLines = 2
            titleLabel.textAlignment = .center
            titleLabel.textColor = .black
            
            self.addSubview(posterImageView)
            self.addSubview(titleLabel)
            addConstraints()
        }
    }
    
    private func addConstraints() {
        let indent: CGFloat = 5.0
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: indent),
            posterImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: indent),
            posterImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -indent),
            posterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: indent),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -indent),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -indent),
            //titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterImageView.dataTask?.cancel()
        self.posterImageView.dataTask = nil
    }
}
