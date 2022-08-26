//
//  SearchedTableViewCell.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import UIKit

final class SearchedTableViewCell: UITableViewCell {
    let posterImageView = CachedImageView()
    let titleLabel = UILabel()
    let ratingLabel = UILabel()
    
    override func prepareForReuse() {
        posterImageView.dataTask?.cancel()
        posterImageView.dataTask = nil
    }
    
    public func configure(imageUrl: String?, title: String?, rating: Float?) {
        self.selectionStyle = .none
        
        posterImageView.loadImage(urlString: Links.imageLink(imageUrl).rawValue)
        titleLabel.text = title ?? "Unknown"
        
        if let rating = rating {
            ratingLabel.text = String(rating)
            if rating < 4 {
                ratingLabel.textColor = .red
            } else if rating < 7 {
                ratingLabel.textColor = .orange
            } else {
                ratingLabel.textColor = .green
            }
        }
        
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        posterImageView.contentMode = .scaleAspectFit
        posterImageView.layer.cornerRadius = 7
        posterImageView.layer.masksToBounds = true
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        ratingLabel.font = UIFont.systemFont(ofSize: 15)
        
        self.addSubview(posterImageView)
        self.addSubview(titleLabel)
        self.addSubview(ratingLabel)
    }
    
    private func addConstraints() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            posterImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -20),
            posterImageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 9/16),
            posterImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.rightAnchor.constraint(equalTo: ratingLabel.leftAnchor, constant: -15)
        ])
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            ratingLabel.widthAnchor.constraint(equalToConstant: 30),
            ratingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
