//
//  InfoViewModelInput.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import Foundation

protocol InfoViewModelInput: AnyObject {
    var movie_id: Int { get }
    func dataRequest(urlString: String, httpMethod: HTTPMethod, _ completion: @escaping (DetailInfoModel?) -> Void)
}
