//
//  ListTableView.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import UIKit

final class ListTableViewContainer: UIView, UITableViewDelegate, UITableViewDataSource  {
    public var model: FoundMovies? {
        didSet {
            tableView.reloadData()
            let indexPath = IndexPath(row: 0, section: 0)
            if 0 < tableView.numberOfRows(inSection: indexPath.section) {
                tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
    }
    
    public var pageManagerDelegate: PageManagerCellDelegate? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView = UITableView()
    private var response: ((Int?) -> Void)?
    
    public func configure(response: ((Int?) -> Void)?) {
        self.response = response
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.9692241322, green: 0.9692241322, blue: 0.9692241322, alpha: 1)
        
        self.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let quantity = model?.results?.count
        return (quantity ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellsQuantity = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row < cellsQuantity - 1 {
            let cell = SearchedTableViewCell()
            let movie = model?.results?[indexPath.row]
            cell.configure(imageUrl: movie?.poster_path, title: movie?.title, rating: movie?.vote_average)
            return cell
        } else {
            let cell = PageManagerCell()
            cell.configure(currentPage: model?.page ?? 1, totalPages: model?.total_pages ?? 1, delegate: pageManagerDelegate)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellsQuantity = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row < cellsQuantity - 1 {
            return 100
        } else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellsQuantity = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row < cellsQuantity - 1 {
            let movie = model?.results?[indexPath.row]
            response?(movie?.id)
        }
    }
}
