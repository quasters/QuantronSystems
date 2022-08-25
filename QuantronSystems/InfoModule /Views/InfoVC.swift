//
//  InfoVC.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 25.08.2022.
//

import UIKit

class InfoVC: UIViewController {
    var viewModel: InfoViewModelInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        viewModel?.dataRequest(urlString: "https://api.themoviedb.org/3/movie/\(viewModel?.movie_id ?? 0)?api_key=3976da82325caf5b8df23f3e91560b5b&language=en-US",
                               httpMethod: .get) { model in
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
}
