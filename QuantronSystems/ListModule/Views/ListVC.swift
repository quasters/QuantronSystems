//
//  ListVCTableViewController.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import UIKit

class ListVC: UIViewController {
    public var viewModel: ListViewModelInput?
    
    private var tableViewContainer = ListTableViewContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9845411249, green: 0.9845411249, blue: 0.9845411249, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .black
        
        tableViewContainer.configure { [weak self] id in
            self?.viewModel?.showInfo(id: id)
        }
        tableViewContainer.pageManagerDelegate = self

        getData(page: 1)
        
        self.view.addSubview(tableViewContainer)
        tableViewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewContainer.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableViewContainer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableViewContainer.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func getData(page: Int) {
        guard let viewModel = viewModel else { return }
        self.viewModel?.request(urlString: Links.find(viewModel.link, page).rawValue, httpMethod: .get, { [weak self] movies in
            self?.tableViewContainer.model = movies
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension ListVC: PageManagerCellDelegate {
    func reloadData(page: Int) {
        getData(page: page)
    }
}
