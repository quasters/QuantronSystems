//
//  SearchHeaderView.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import UIKit

final class SearchHeaderView: UIView, UITextFieldDelegate {
    private let textField = UITextField()
    private let button = UIButton()
    private var response: ((String?) -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let image = UIImage(systemName: "xmark.circle.fill")
        button.setImage(image, for: .normal)
    }
    
    public func configure(response: ((String?) -> Void)?) {
        self.backgroundColor = #colorLiteral(red: 0.9549447372, green: 0.9549447372, blue: 0.9549447372, alpha: 1)
        self.response = response
        setUpTextField()
        setUpClearButton()
    }
    
    private func setUpTextField() {
        textField.placeholder = "Find Movie"
        textField.borderStyle = .none
        textField.delegate = self
        
        textField.addTarget(self, action: #selector(findMovies(_:)), for: .editingChanged)
        
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    private func setUpClearButton() {
        button.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.addTarget(self, action: #selector(clearAll), for: .touchUpInside)
        
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            button.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            button.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            button.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            
            textField.rightAnchor.constraint(equalTo: button.leftAnchor, constant: -10)
        ])
    }
    
    @objc
    private func findMovies(_ textField: UITextField) {
        response?(textField.text)
    }
    
    @objc
    private func clearAll() {
        textField.text = ""
        textField.resignFirstResponder()
        response?(textField.text)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
