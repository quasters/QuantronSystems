//
//  Builder.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

final class Builder: BuilderProtocol {
    func createMainModule(coordinator: Coordinator) -> UIViewController {
        let vc = MainVC()
        let vm = MainVM(coordinator: coordinator)
        vc.viewModel = vm
        return vc
    }
    
    func createSearchModule(coordinator: Coordinator) -> UIViewController {
        let vc = SearchVC()
        let vm = SearchVM(coordinator: coordinator)
        vc.viewModel = vm
        return vc
    }
}
