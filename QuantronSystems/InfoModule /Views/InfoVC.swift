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
    private var movie: DetailInfoModel? {
        didSet {
            self.title = movie?.title
            
            let urlString = Links.imageLink(movie?.poster_path).rawValue
            self.header.cachedImageView.loadImage(urlString: urlString)
            
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9180000627, green: 0.9180000627, blue: 0.9180000627, alpha: 1)
        
        setNavigationStyle()
        addTableView()
        
        header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height / 1.75))
        self.tableView.tableHeaderView = header
        
        viewModel?.dataRequest(urlString: Links.detailInfo(viewModel?.movie_id).rawValue,
                               httpMethod: .get) { [weak self] movie in
            self?.movie = movie
        }
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
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9180000627, green: 0.9180000627, blue: 0.9180000627, alpha: 1)
    }
    
    private func addTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.frame = self.view.bounds
        //tableView.center = self.view.center
        tableView.separatorStyle = .none
        
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = InfoTableViewCell()
        switch indexPath.row {
        case 0:
            cell.configure(title: "Overview", value: movie?.overview)
        case 1:
            var genres = ""
            if let genresArray = movie?.genres?.map({ $0.name ?? "" }) {
                genres = genresArray.joined(separator: ", ")
            }
            cell.configure(title: "Genres", value: genres)
        case 2:
            let durationString = String(movie?.runtime ?? 0) + " minutes"
            cell.configure(title: "Duration", value: durationString)
        case 3:
            cell.configure(title: "Release", value: movie?.release_date)
        default:
            cell.configure(title: "Error", value: nil)
        }
        
        return cell
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
