//
//  InfoVM.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 25.08.2022.
//

import Foundation

protocol InfoViewModelInput: AnyObject {
    
}

final class InfoVM: InfoViewModelInput {
    private var completion: (() -> Void)?
    private var movie_id: Int
    private var network: NetworkDataFetcherProtocol
    
    init(movie_id: Int, completion: (() -> Void)?, network: NetworkDataFetcherProtocol = NetworkDataFetcher()) {
        self.completion = completion
        self.movie_id = movie_id
        self.network = network
    }
    
//    func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping () -> Void) {
//        network.fetchData(urlString: urlString, httpMethod: httpMethod) { (movies: MovieList?) in
//            guard let movies = movies else { return }
//            self.movies = movies
//            completion()
//        }
//    }
    
    // "https://api.themoviedb.org/3/movie/\(movie_id)?api_key=3976da82325caf5b8df23f3e91560b5b&language=en-US"
}
