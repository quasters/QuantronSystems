//
//  SearchVC.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation

protocol SearchViewModelInput {
    
}

final class SearchVM: SearchViewModelInput {
    private var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
