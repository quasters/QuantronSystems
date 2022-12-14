//
//  NetworkDataFetcher.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation

final class NetworkDataFetcher: NetworkDataFetcherProtocol {
    private let networkService: NetworkServiceProtocol = NetworkService()
    
    public func fetchData<T>(urlString: String, httpMethod: HTTPMethod, response: @escaping (T?) -> Void) where T: Decodable {
        networkService.request(urlString: urlString, httpMethod: httpMethod) { result in
            switch result {
            case .success(let data):
                do {
                    let items = try JSONDecoder().decode(T.self, from: data)
                    response(items)
                } catch let jsonError {
                    print("Failed to decode JSON:", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: ", error)
                response(nil)
            }
        }
    }
}
