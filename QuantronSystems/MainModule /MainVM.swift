//
//  MainVM.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation

protocol MainViewModelInput: AnyObject {
    var movies: MainModel { get set }
    func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping () -> Void)
}

final class MainVM: MainViewModelInput {
    var movies = MainModel()
    private var coordinator: Coordinator
    private let network: NetworkDataFetcherProtocol
    
    init(coordinator: Coordinator, network: NetworkDataFetcherProtocol = NetworkDataFetcher.shared) {
        self.coordinator = coordinator
        self.network = network
    }
    
    func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping () -> Void) {
        network.fetchData(urlString: urlString, httpMethod: httpMethod) { (movies: MainModel?) in
            guard let movies = movies else { return }
            self.movies = movies
            completion()
        }
    }
}
