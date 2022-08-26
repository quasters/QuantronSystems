//
//  FoundedMovies.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import Foundation

struct FoundMovies: Decodable {
    var page: Int?
    var results: [SearchedMovie]?
    var total_pages: Int?
    var total_results: Int?
}

struct SearchedMovie: Decodable {
    var id: Int?
    var title: String?
    var poster_path: String?
    var vote_average: Float?
}
