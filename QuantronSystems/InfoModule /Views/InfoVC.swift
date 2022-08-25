//
//  InfoVC.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 25.08.2022.
//

import UIKit

class InfoVC: UIViewController {
    public var viewModel: InfoViewModelInput?
    private let tableView = UITableView()
    private var header = StretchyTableHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9180000627, green: 0.9180000627, blue: 0.9180000627, alpha: 1)
        
        setNavigationStyle()
        addTableView()
        
        
        
        header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height / 1.75))
        
        
        
        viewModel?.dataRequest(urlString: "https://api.themoviedb.org/3/movie/\(viewModel?.movie_id ?? 0)?api_key=3976da82325caf5b8df23f3e91560b5b&language=en-US",
                               httpMethod: .get) { [weak self] in
            self?.tableView.reloadData()
            let urlString = "https://image.tmdb.org/t/p/original\(self?.viewModel?.movie?.poster_path ?? "/0")"
            self?.header.cachedImageView.loadImage(urlString: urlString)
            self?.title = self?.viewModel?.movie?.title
        }
        
        self.tableView.tableHeaderView = header
        
        

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setNavigationStyle() {
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9180000627, green: 0.9180000627, blue: 0.9180000627, alpha: 1)
    }
    
    private func addTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        tableView.center = self.view.center
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}











// MARK: - UITableViewDataSource, UITableViewDelegate
extension InfoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 28
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "Hi"
        return cell!
    }
    
    
}



// MARK: - UIScrollViewDelegate
extension InfoVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else { return }
        header.scrollViewDidScroll(scrollView: tableView) { [weak self] onTop in
            if onTop {
                self?.navigationController?.navigationBar.barTintColor = .white
            } else {
                self?.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9180000627, green: 0.9180000627, blue: 0.9180000627, alpha: 1)
            }
        }
    }
}
