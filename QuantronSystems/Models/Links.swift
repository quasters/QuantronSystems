//
//  Links.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import Foundation

enum Links {
    case popularMovies
    case detailInfo(Int?)
    case imageLink(String?)
    case find(String?, Int = 1)
    
    var rawValue: String {
        switch self {
        case .imageLink(let path):
            return "https://image.tmdb.org/t/p/w500\(path ?? "/0")"
        case .popularMovies:
            return "https://api.themoviedb.org/3/trending/all/day?api_key=3976da82325caf5b8df23f3e91560b5b"
        case .detailInfo(let id):
            return "https://api.themoviedb.org/3/movie/\(id ?? 0)?api_key=3976da82325caf5b8df23f3e91560b5b&language=en-US"
        case .find(let name, let page):
            guard let name = name else { return "" }
            let queryName = name
                .components(separatedBy: " ")
                .filter { !$0.isEmpty }
                .joined(separator: "%20")
            return "https://api.themoviedb.org/3/search/movie?api_key=3976da82325caf5b8df23f3e91560b5b&language=en-US&query=\(queryName)&page=\(page)&include_adult=true"
        }
    }
}
