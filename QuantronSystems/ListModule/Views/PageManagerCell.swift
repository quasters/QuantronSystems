//
//  PageManagerCell.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import UIKit

final class PageManagerCell: UITableViewCell {
    private var currentPage = 1
    private var totalPages = 1
    
    var delegate: PageManagerCellDelegate?

    private let stack = UIStackView()
    private var buttons = [UIButton]()
    
    public func configure(currentPage: Int, totalPages: Int, delegate: PageManagerCellDelegate?) {
        self.currentPage = currentPage
        self.totalPages = totalPages
        self.delegate = delegate
        
        self.contentView.isUserInteractionEnabled = true
        self.selectionStyle = .none
        self.backgroundColor = #colorLiteral(red: 0.9845411249, green: 0.9845411249, blue: 0.9845411249, alpha: 1)
        
        setUpStack()
        createButtons()
    }
    
    private func setUpStack() {
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 15

        self.addSubview(stack)
        addStackConstraints()
    }
    
    private func createButtons() {
        let drawPagesCount = totalPages > 5 ? 5 : totalPages
        for i in 1...drawPagesCount {
            let button = UIButton()
            
            if currentPage < 3 {
                button.tag = i
                button.setTitle("\(i)", for: .normal)
                button.backgroundColor = currentPage == i ? .black : .clear
                button.setTitleColor(currentPage == i ? .white : .black, for: .normal)
            } else if totalPages - currentPage < 3 {
                let currentDrawPage = totalPages - drawPagesCount + i
                button.tag = currentDrawPage
                button.setTitle("\(currentDrawPage)", for: .normal)
                button.backgroundColor = currentPage == currentDrawPage ? .black : .clear
                button.setTitleColor(currentPage == currentDrawPage ? .white : .black, for: .normal)
            } else {
                let currentDrawPage = currentPage - 3 + i
                button.tag = currentDrawPage
                button.setTitle("\(currentDrawPage)", for: .normal)
                button.backgroundColor = currentPage == currentDrawPage ? .black : .clear
                button.setTitleColor(currentPage == currentDrawPage ? .white : .black, for: .normal)
            }
            
            button.titleLabel?.textAlignment = .center
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 8
            button.layer.masksToBounds = true
            
            button.addTarget(self, action: #selector(reloadData), for: .touchUpInside)
            
            stack.addArrangedSubview(button)
            buttons.append(button)
        }
    }
    
    @objc
    private func reloadData(_ sender: UIButton) {
        delegate?.reloadData(page: sender.tag)
    }
    
    private func addStackConstraints() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.heightAnchor.constraint(equalToConstant: 50),
            stack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 2/3),
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
