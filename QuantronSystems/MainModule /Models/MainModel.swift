//
//  Model.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation

struct MovieList: Decodable {
    var results: [MainInfoAboutMovie]?
}

struct MainInfoAboutMovie: Decodable {
    var id: Int?
    var poster_path: String?
    var name: String?
    var title: String?
}
