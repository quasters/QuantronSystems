//
//  SearchVC.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

final class SearchVC: UIViewController {
    public var viewModel: SearchViewModelInput?
    
    private let headerView = SearchHeaderView()
    private let tableView = SearchedTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        
        setUpHeaderView()
        setUpTableView()
    }

    private func setUpHeaderView() {
        headerView.layer.cornerRadius = 22
        headerView.layer.masksToBounds = true
        headerView.configure { [weak self] text in
            self?.viewModel?.dataRequest(urlString: Links.find(text).rawValue, httpMethod: .get, { movies in
                self?.tableView.model = movies
            })
        }
        
        self.view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setUpTableView() {
        tableView.configure { [weak self] id in
            guard let id = id else { return }
            self?.viewModel?.pushItemToShow(id: id)
        }
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
