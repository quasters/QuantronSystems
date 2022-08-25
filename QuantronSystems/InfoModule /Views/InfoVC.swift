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
        self.view.backgroundColor = .red
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
