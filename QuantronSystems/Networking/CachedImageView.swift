//
//  CachedImageView..swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 24.08.2022.
//

import UIKit

final class CachedImageView: UIImageView {
    private static let imageCache = NSCache<NSString, UIImage>()
    private let activityIndicator = UIActivityIndicatorView()
    
    public var dataTask: URLSessionDataTask?
    
    public func loadImage(urlString: String, completion: (() -> Void)? = nil)  {
        self.image = nil
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
        addActivityIndicatorConstraints()
        
        let urlKey = urlString as NSString
        if let cachedItem = CachedImageView.imageCache.object(forKey: urlKey) {
            image = cachedItem
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            completion?()
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        self.dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error of getting data by CachedImageView:", error)
                    return
                }

                guard let data = data else { return }
                if let image = UIImage(data: data) {
                    CachedImageView.imageCache.setObject(image, forKey: urlKey)
                    self?.image = image
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.isHidden = true
                    completion?()
                }
            }
        }
        self.dataTask?.resume()
    }
    
    private func addActivityIndicatorConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.widthAnchor.constraint(equalTo: self.widthAnchor),
            activityIndicator.heightAnchor.constraint(equalTo: self.heightAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
