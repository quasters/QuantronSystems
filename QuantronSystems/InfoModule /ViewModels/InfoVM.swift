//
//  InfoVM.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 25.08.2022.
//

import Foundation

protocol InfoViewModelInput: AnyObject {
    var movie_id: Int { get }
    func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping (DetailInfoModel?) -> Void)
}

final class InfoVM: InfoViewModelInput {
    public var movie_id: Int
    
    private var completion: (() -> Void)?
    private var network: NetworkDataFetcherProtocol
    
    init(movie_id: Int, completion: (() -> Void)?, network: NetworkDataFetcherProtocol = NetworkDataFetcher()) {
        self.completion = completion
        self.movie_id = movie_id
        self.network = network
    }
    
    public func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping (DetailInfoModel?) -> Void) {
        network.fetchData(urlString: urlString, httpMethod: httpMethod) { (movie: DetailInfoModel?) in
            completion(movie)
        }
    }
}
