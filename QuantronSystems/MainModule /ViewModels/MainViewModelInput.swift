//
//  MainViewModelInput.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 25.08.2022.
//

import Foundation

protocol MainViewModelInput: AnyObject {
    var movies: MovieList { get }
    func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping () -> Void)
    func pushItemToShow(id: Int)
}
