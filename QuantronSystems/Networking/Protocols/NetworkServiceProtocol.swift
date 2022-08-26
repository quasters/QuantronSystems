//
//  NetworkServiceProtocol.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 26.08.2022.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func request(urlString: String, httpMethod: HTTPMethod, completion: @escaping (Result<Data, Error>) -> Void)
}
