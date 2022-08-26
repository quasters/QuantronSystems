//
//  NetworkDataFetcherProtocol.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import Foundation

protocol NetworkDataFetcherProtocol: AnyObject {
    func fetchData<T>(urlString: String, httpMethod: HTTPMethod, response: @escaping (T?) -> Void) where T: Decodable
}
