//
//  InfoTableViewCell.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import UIKit

final class InfoTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    public func configure(title: String?, value: String?) {
        self.selectionStyle = .none
        
        titleLabel.text = title?.uppercased()
        valueLabel.text = value
        
        self.addSubview(titleLabel)
        self.addSubview(valueLabel)
        
        configureTitleLabel()
        configureValueLabel()
    }
    
    private func configureTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10)
        ])
    }
    
    private func configureValueLabel() {
        valueLabel.font = UIFont.systemFont(ofSize: 16)
        valueLabel.numberOfLines = 0
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 20),
            valueLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
