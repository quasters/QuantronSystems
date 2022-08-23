//
//  UIImageView + Extension.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 23.08.2022.
//

import UIKit

extension UIImageView {
    func downloadFrom(urlString: String) {
        NetworkDataFetcher.shared.fetchImage(urlString: urlString) { image in
            self.image = image
        }
    }
}
