//
//  MainCoordinator.swift
//  Coordinator-Estudo
//
//  Created by Jefferson Silva on 26/11/21.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    
    weak var parent: CoordinatorProtocol?
    
    var childCoordinators: [CoordinatorProtocol]? = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Initial Config
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - Controller Presentation
    // Por essa função ser idêntica à anterior, acho que poderíamos usar Swift Generics aqui.
    func createControllerNumberOne() {
        let controllerOneCoordinator = ControllerOneCoordinator(navigationController: navigationController)
        childCoordinators?.append(controllerOneCoordinator)
        controllerOneCoordinator.parent = self
        controllerOneCoordinator.start()
    }
    
    func createControllerNumberTwo() {
        let vc = ViewControllerNumberTwo()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
