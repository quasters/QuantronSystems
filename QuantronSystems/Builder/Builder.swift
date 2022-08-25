//
//  Builder.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

final class Builder: BuilderProtocol {
    public func createMainModule(showInfoWithId: ((Int) -> Void)?) -> UIViewController {
        let vc = MainVC()
        let vm = MainVM(showInfoWithId: showInfoWithId)
        vc.viewModel = vm
        return vc
    }
    
    public func createSearchModule(coordinator: Coordinator) -> UIViewController {
        let vc = SearchVC()
        let vm = SearchVM(coordinator: coordinator)
        vc.viewModel = vm
        return vc
    }
    
    public func createInfoModule(movie_id: Int, completion: (() -> Void)?) -> UIViewController {
        let vc = InfoVC()
        let vm = InfoVM(movie_id: movie_id,completion: completion)
        vc.viewModel = vm
        return vc
    }
}
