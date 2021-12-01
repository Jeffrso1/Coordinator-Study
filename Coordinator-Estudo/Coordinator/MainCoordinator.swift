//
//  MainCoordinator.swift
//  Coordinator-Estudo
//
//  Created by Jefferson Silva on 26/11/21.
//

import UIKit

class MainCoordinator: NSObject, CoordinatorProtocol {
    
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
        navigationController.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - Controller Presentation
    // Por essa função ser idêntica à próxima, acho que poderíamos usar Swift Generics aqui.
    func createControllerNumberOne() {
        let controllerOneCoordinator = ControllerOneCoordinator(navigationController: navigationController)
        childCoordinators?.append(controllerOneCoordinator)
        controllerOneCoordinator.parent = self
        controllerOneCoordinator.start()
    }
    
    func createControllerNumberTwo() {
        let controllerTwoCoordinator = ControllerTwoCoordinator(navigationController: navigationController)
        childCoordinators?.append(controllerTwoCoordinator)
        controllerTwoCoordinator.parent = self
        controllerTwoCoordinator.start()
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(fromViewController) else { return }
        
        
        // Não respeita o open-closed principle.
        if let viewControllerNumberOne = fromViewController as? ViewControllerNumberOne,
           let coordinator = viewControllerNumberOne.coordinator {
            childDidFinish(coordinator)
        }
        
        if let viewControllerNumberTwo = fromViewController as? ViewControllerNumberTwo,
           let coordinator = viewControllerNumberTwo.coordinator {
            childDidFinish(coordinator)
        }
    }
    
}
