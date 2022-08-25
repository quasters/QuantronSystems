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
    private let activityIndicator = UIActivityIndicatorView()
    
    var item: MainInfoAboutMovie? {
        didSet {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            
            setUpPosterImageView()
            setUpTitleLabel()

            self.addSubview(activityIndicator)
            self.addSubview(posterImageView)
            self.addSubview(titleLabel)
            addConstraints()
        }
    }
    
    private func setUpPosterImageView() {
        let urlString = "https://image.tmdb.org/t/p/w500\(item?.poster_path ?? "0")"
        posterImageView.loadImage(urlString: urlString) { [activityIndicator] in
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
        posterImageView.contentMode = .scaleToFill
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
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.widthAnchor.constraint(equalTo: self.posterImageView.widthAnchor),
            activityIndicator.heightAnchor.constraint(equalTo: self.posterImageView.heightAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.posterImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.posterImageView.centerYAnchor)
        ])
        
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.posterImageView.dataTask?.cancel()
        self.posterImageView.dataTask = nil
    }
}
