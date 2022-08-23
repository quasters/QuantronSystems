//
//  MainCollectionViewCell.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 23.08.2022.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    private var posterImageView = UIImageView()
    private var titleLabel = UILabel()
    
    func configure(imageURLString: String, title: String) {
        posterImageView.downloadFrom(urlString: imageURLString)
        posterImageView.contentMode = .scaleToFill
        
        titleLabel.text = title
        titleLabel.textColor = .black
        
        self.addSubview(posterImageView)
        self.addSubview(titleLabel)
        addConstraints()
    }
    
    private func addConstraints() {
        let indent: CGFloat = 5.0
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: indent),
            posterImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: indent),
            posterImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -indent),
            posterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: indent),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: indent),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -indent),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -indent)
        ])
    }
    
    override func prepareForReuse() {
        posterImageView.image = nil
    }
}
