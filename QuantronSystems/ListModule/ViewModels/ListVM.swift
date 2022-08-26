//
//  ListVM.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import Foundation

protocol ListViewModelInput {
    var link: String { get }
    func request(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping (FoundMovies?) -> Void)
    func showInfo(id: Int?)
}

final class ListVM: ListViewModelInput {
    public var link: String
    private let completion: ((Int?) -> Void)?
    private let network: NetworkDataFetcherProtocol?
    
    init(link: String, completion: ((Int?) -> Void)?, network: NetworkDataFetcherProtocol = NetworkDataFetcher()) {
        self.link = link
        self.completion = completion
        self.network = network
    }
    
    public func request(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping (FoundMovies?) -> Void) {
        network?.fetchData(urlString: urlString, httpMethod: httpMethod, response: { (movies: FoundMovies?) in
            completion(movies)
        })
    }
    
    public func showInfo(id: Int?) {
        completion?(id)
    }
}
