//
//  UIImageView + Extension.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 23.08.2022.
//

import UIKit

extension UIImageView {
    func downloadFrom(urlString: String) {
        let network: NetworkDataFetcherProtocol = NetworkDataFetcher()
        print("-----------------urlString = \(urlString)")
        network.fetchImage(urlString: urlString) { image in
            self.image = image
        }
    }
}
