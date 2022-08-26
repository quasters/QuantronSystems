//
//  SearchViewModelInput.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import Foundation

protocol SearchViewModelInput: AnyObject {
    func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping (FoundMovies?) -> Void)
    func showVC(id: Int?, link: String?)
}
