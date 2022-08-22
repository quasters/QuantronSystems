//
//  Model.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation

struct MainModel: Decodable {
    var results: [Movies]?
}

struct Movies: Decodable {
    var id: Int?
    var poster_path: String?
    var name: String?
}
