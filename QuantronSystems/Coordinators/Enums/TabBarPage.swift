//
//  TabBarPage.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation
import UIKit

enum TabBarPage {
    case main
    case search
    
    init?(index: Int) {
        switch index {
        case 0: self = .main
        case 1: self = .search
        default: return nil
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .search:
            return 1
        }
    }
    
    func titleValue() -> String {
        switch self {
        case .main:
            return "Home"
        case .search:
            return "Search"
        }
    }
    
    func imageValue(isSelected: Bool) -> UIImage? {
        switch self {
        case .main:
            return UIImage(systemName: isSelected ? "house.circle.fill" : "house.circle")
        case .search:
            return UIImage(systemName: isSelected ? "magnifyingglass.fill" : "magnifyingglass")
        }
    }
}
