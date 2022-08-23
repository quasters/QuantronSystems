//
//  NetworkService.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol: AnyObject {
    func request(urlString: String, httpMethod: HTTPMethod, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    private var imageCache = NSCache<NSString, UIImage>()
    
    public func request(urlString: String, httpMethod: HTTPMethod, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
            
        if httpMethod != .none {
            request.httpMethod = httpMethod.rawValue
        } else {
            if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
                guard let data = cachedImage.pngData() else { return }
                completion(.success(data))
            }
        }
        
        session.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error getting data:", error)
                    completion(.failure(error))
                }
                guard let data = data else { return }
                if httpMethod == .none {
                    guard let image = UIImage(data: data) else { return }
                    self?.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                }
                completion(.success(data))
            }
        }.resume()
    }
    
//    class func hasConnectivity() -> Bool {
//        let reachability: Reachability = Reachability.reachabilityForInternetConnection()
//        let networkStatus: Int = reachability.currentReachabilityStatus().value
//        return networkStatus != 0
//    }
}
