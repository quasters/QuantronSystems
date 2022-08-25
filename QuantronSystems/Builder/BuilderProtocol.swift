//
//  BuilderProtocol.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

protocol BuilderProtocol:  AnyObject {
    func createMainModule(showInfoWithId: ((Int) -> Void)?) -> UIViewController
    func createSearchModule(coordinator: Coordinator) -> UIViewController
    func createInfoModule(movie_id: Int, completion: (() -> Void)?) -> UIViewController
}

