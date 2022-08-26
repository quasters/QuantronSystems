//
//  SearchVC.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation

protocol SearchViewModelInput {
    func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping (FoundMovies?) -> Void)
    func pushItemToShow(id: Int)
}

final class SearchVM: SearchViewModelInput {
    private var completion: ((Int) -> Void)?
    private var network: NetworkDataFetcherProtocol
    
    init(completion: ((Int) -> Void)?, network: NetworkDataFetcherProtocol = NetworkDataFetcher()) {
        self.completion = completion
        self.network = network
    }
    
    public func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping (FoundMovies?) -> Void) {
        network.fetchData(urlString: urlString, httpMethod: httpMethod) { (movies: FoundMovies?) in
            completion(movies)
        }
    }
    
    public func pushItemToShow(id: Int) {
        completion?(id)
    }
}
