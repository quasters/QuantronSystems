//
//  Model.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation
import UIKit

struct MainModel: Decodable {
    var results: [Movie]?
}

struct Movie: Decodable {
    var id: Int?
    var poster_path: String?
    var name: String?
    var title: String?
    
//    var poster: UIImage? {
//        guard let url = URL(string: "https://image.tmdb.org/t/p/original\(poster_path ?? "0")") else { return nil }
//        guard let data = try? Data(contentsOf: url) else { return nil }
//        return UIImage(data: data)
//    }
}
