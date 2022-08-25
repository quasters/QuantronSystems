//
//  MainVM.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation

final class MainVM: MainViewModelInput {
    var movies = MovieList()
    
    private var showInfoWithId: ((Int) -> Void)?
    private let network: NetworkDataFetcherProtocol
    
    init(showInfoWithId: ((Int) -> Void)?, network: NetworkDataFetcherProtocol = NetworkDataFetcher()) {
        self.showInfoWithId = showInfoWithId
        self.network = network
    }
    
    func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping () -> Void) {
        network.fetchData(urlString: urlString, httpMethod: httpMethod) { (movies: MovieList?) in
            guard let movies = movies else { return }
            self.movies = movies
            completion()
        }
    }
    
    func pushItemToShow(id: Int) {
        showInfoWithId?(id)
    }
}
