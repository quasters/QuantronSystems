//
//  NetworkService.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    public func request(urlString: String, httpMethod: HTTPMethod, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = httpMethod.rawValue
        
        session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error getting data by NetworkService:", error)
                    completion(.failure(error))
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
}
