//
//  SearchVC.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation

final class SearchVM: SearchViewModelInput {
    private var completion: ((Int?, String?) -> Void)?
    private var network: NetworkDataFetcherProtocol
    
    init(completion: ((Int?, String?) -> Void)?, network: NetworkDataFetcherProtocol = NetworkDataFetcher()) {
        self.completion = completion
        self.network = network
    }
    
    public func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping (FoundMovies?) -> Void) {
        network.fetchData(urlString: urlString, httpMethod: httpMethod) { (movies: FoundMovies?) in
            completion(movies)
        }
    }
    
    public func showVC(id: Int?, link: String?) {
        completion?(id, link)
    }
}
