//
//  ControllerTwoCoordinator.swift
//  Coordinator-Estudo
//
//  Created by Jefferson Silva on 30/11/21.
//

import UIKit

class ControllerTwoCoordinator: CoordinatorProtocol {
    
    weak var parent: CoordinatorProtocol?
    
    var childCoordinators: [CoordinatorProtocol]?
    
    var navigationController: UINavigationController
    
    func start() {
        let vc = ViewControllerNumberTwo()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
