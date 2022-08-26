//
//  ViewController.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

final class MainVC: UIViewController {
    public var viewModel: MainViewModelInput?
    
    private var collectionBackgroundView: CollectionBackgroundView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Popular Movies"
        
        setCollectionBackgroundView()
        if let collectionBackgroundView = collectionBackgroundView {
            self.view.addSubview(collectionBackgroundView)
            addConstraints()
        }
        
        viewModel?.dataRequest(urlString: Links.popularMovies.rawValue,
                               httpMethod: .get) { [collectionBackgroundView, viewModel] in
            collectionBackgroundView?.items = viewModel?.movies
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(showInfo), name: NSNotification.Name("showInfo"), object: nil)
    }

    @objc
    private func showInfo(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let userInfoId = userInfo["id"] as? Int else { return }
        viewModel?.pushItemToShow(id: userInfoId)
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

