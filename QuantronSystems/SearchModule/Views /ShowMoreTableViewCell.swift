//
//  ShowMoreTableViewCell.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import UIKit

final class ShowMoreTableViewCell: UITableViewCell {
    private let view = UIView()
    private let titleLable = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.layer.cornerRadius = view.bounds.height / 2
        view.layer.masksToBounds = true
    }
    
    public func configure(text: String?) {
        titleLable.text = text
        
        self.selectionStyle = .none
        self.backgroundColor = #colorLiteral(red: 0.9845411249, green: 0.9845411249, blue: 0.9845411249, alpha: 1)
        addViews()
    }
    
    private func addViews() {
        view.backgroundColor = .black
        
        titleLable.font = UIFont.systemFont(ofSize: 15)
        titleLable.textColor = .white
        
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 50),
            view.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 2/3),
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        
        self.addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLable.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
