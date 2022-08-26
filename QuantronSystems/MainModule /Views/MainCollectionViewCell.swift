//
//  MainCollectionViewCell.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 23.08.2022.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    private let posterImageView = CachedImageView()
    private var titleLabel = UILabel()
    
    public var item: MainInfoAboutMovie? {
        didSet {
            setUpPosterImageView()
            setUpTitleLabel()

            self.addSubview(posterImageView)
            self.addSubview(titleLabel)
            addConstraints()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.posterImageView.dataTask?.cancel()
        self.posterImageView.dataTask = nil
    }
    
    private func setUpPosterImageView() {
        let urlString = Links.imageLink(item?.poster_path).rawValue
        posterImageView.loadImage(urlString: urlString)
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 8
        posterImageView.layer.masksToBounds = true
    }
    
    private func setUpTitleLabel() {
        titleLabel.text = item?.title ?? item?.name ?? "Unknown"
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
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
        ])
    }
}
