//
//  BuilderProtocol.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

protocol BuilderProtocol:  AnyObject {
    func createMainModule(coordinator: Coordinator) -> UIViewController
    func createSearchModule(coordinator: Coordinator) -> UIViewController
}

