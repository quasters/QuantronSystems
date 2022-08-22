//
//  ViewController.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

final class MainVC: UIViewController {
    var viewModel: MainViewModelInput?
    
    var collectionBackgroundView: CollectionBackgroundView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
       
        
        viewModel?.dataRequest(urlString: "https://api.themoviedb.org/3/trending/all/day?api_key=3976da82325caf5b8df23f3e91560b5b", httpMethod: .get) {
            collectionBackgroundView?.
        }
        setCollectionBackgroundView()
    }
    
    func setCollectionBackgroundView() {
        collectionBackgroundView = CollectionBackgroundView()
        collectionBackgroundView.configure()
        
        self.view.addSubview(collectionBackgroundView)
        collectionBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionBackgroundView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionBackgroundView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionBackgroundView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }

}

