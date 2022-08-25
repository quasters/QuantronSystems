//
//  DetailModel.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 25.08.2022.
//

import Foundation

struct DetailInfoModel: Decodable {
    var title: String?
    var release_date: String?
    var runtime: Int?
    var genres: [Genres]?
    var poster_path: String?
    var overview: String?
}

struct Genres: Decodable {
    var name: String?
}
