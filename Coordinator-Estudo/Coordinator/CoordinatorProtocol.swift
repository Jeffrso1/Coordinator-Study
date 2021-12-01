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
    
    func childDidFinish(_ coordinator: CoordinatorProtocol)
    
}
extension CoordinatorProtocol {
    
    func childDidFinish(_ coordinator: CoordinatorProtocol) {
        guard var childCoordinators = childCoordinators else { return }
        
        for (index, child) in childCoordinators.enumerated() {
            if child === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}
