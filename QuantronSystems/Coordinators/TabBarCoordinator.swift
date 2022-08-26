//
//  TabBarCoordinator.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    public var tabBarController: UITabBarController
    
    public var navigationController: UINavigationController
    
    public var childCoordinators = [Coordinator]()
    
    public var type: CoordinatorType = .tab
    
    private var builder: BuilderProtocol
    
    required init(_ navigationController: UINavigationController, builder: BuilderProtocol = Builder()) {
        self.navigationController = navigationController
        tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = .black
        
        self.builder = builder
    }
    
    public func start() {
        let pages: [TabBarPage] = [.main, .search]
        let controllers = pages.map({ getTabControllers($0) })
        prepareTabBarModule(withTabControllers: controllers)
    }
    
    public func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    public func currentPage() -> TabBarPage? {
        return TabBarPage.init(index: tabBarController.selectedIndex)
    }
    
    private func getTabControllers(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        navController.tabBarItem = UITabBarItem(title: page.titleValue(),
                                                image: page.imageValue(isSelected: false),
                                                selectedImage: page.imageValue(isSelected: true))
        
        switch page {
        case .main:
            let vc = builder.createMainModule { [weak self] id in
                self?.showInfoModule(with: id)
            }
            navController.pushViewController(vc, animated: true)
            
        case .search:
            let vc = builder.createSearchModule { [weak self] id in
                self?.showInfoModule(with: id)
            }
            navController.pushViewController(vc, animated: true)
        }
        
        return navController
    }
    
    private func showInfoModule(with id: Int) {
        let vc = builder.createInfoModule(movie_id: id, completion: nil)
        print("ok")
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func prepareTabBarModule(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.main.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        navigationController.pushViewController(tabBarController, animated: true)
    }
}
