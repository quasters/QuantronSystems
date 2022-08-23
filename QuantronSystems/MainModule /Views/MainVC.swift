//
//  ViewController.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

final class MainVC: UIViewController {
    var viewModel: MainViewModelInput?
    
    private var collectionBackgroundView: CollectionBackgroundView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
       
        print("HI")
        
        setCollectionBackgroundView()
        if let collectionBackgroundView = collectionBackgroundView {
            self.view.addSubview(collectionBackgroundView)
            addConstraints()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel?.dataRequest(urlString: "https://api.themoviedb.org/3/trending/all/day?api_key=3976da82325caf5b8df23f3e91560b5b",
                               httpMethod: .get) { [collectionBackgroundView, viewModel] in
            collectionBackgroundView?.items = viewModel?.movies
        }
    }
    
    private func setCollectionBackgroundView() {
        collectionBackgroundView = CollectionBackgroundView()
        guard let collectionBackgroundView = collectionBackgroundView else { return }
        collectionBackgroundView.configure()
    }
    
    private func addConstraints() {
        guard let collectionBackgroundView = collectionBackgroundView else { return }

        collectionBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionBackgroundView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionBackgroundView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionBackgroundView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }

}

