//
//  SearchedTableView.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import UIKit

final class SearchedTableView: UIView {
    public var link: String?
    private let tableView = UITableView()
    private var response: ((Int?, String?) -> Void)?
    
    var model: FoundMovies? {
        didSet {
            tableView.reloadData()
            let indexPath = IndexPath(row: 0, section: 0)
            if 0 < tableView.numberOfRows(inSection: indexPath.section) {
                tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
    }
    
    public func configure(response: ((Int?, String?) -> Void)?) {
        self.response = response
        setUpTableView()
        addConstraints()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.9692241322, green: 0.9692241322, blue: 0.9692241322, alpha: 1)
        
        self.addSubview(tableView)
    }
    
    private func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}

extension SearchedTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let quantity = model?.results?.count
        if let quantity = quantity {
            return quantity <= 10 ? quantity : 11
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellsQuantity = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row < cellsQuantity - 1 || cellsQuantity <= 10 {
            let cell = SearchedTableViewCell()
            let movie = model?.results?[indexPath.row]
            cell.configure(imageUrl: movie?.poster_path, title: movie?.title, rating: movie?.vote_average)
            return cell
        } else {
            let cell = ShowMoreTableViewCell()
            cell.configure(text: "Show remaining \((model?.total_results ?? cellsQuantity) - cellsQuantity) items")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellsQuantity = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row < cellsQuantity - 1 || cellsQuantity <= 10 {
            return 100
        } else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellsQuantity = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row < cellsQuantity - 1 || cellsQuantity <= 10 {
            let movie = model?.results?[indexPath.row]
            response?(movie?.id, nil)
        } else {
            response?(nil, link)
        }
    }
}
