//
//  Coordinator.swift
//  Coordinator-Estudo
//
//  Created by Jefferson Silva on 26/11/21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var parent: CoordinatorProtocol? {get set}
    
    var childCoordinators: [CoordinatorProtocol]? { get set }
    
    var navigationController: UINavigationController { get set }
    
    func start()
    
    func finish()
    
    func childDidFinish(_ child: CoordinatorProtocol)
    
}
extension CoordinatorProtocol {
    
    func finish() {
        guard let parent = parent else { return }
        parent.childDidFinish(self)
    }
    
    func childDidFinish(_ child: CoordinatorProtocol) {
        guard var childCoordinators = childCoordinators else { return }
        
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}
