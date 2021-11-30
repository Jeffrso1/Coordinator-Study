//
//  Coordinator.swift
//  Coordinator-Estudo
//
//  Created by Jefferson Silva on 26/11/21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var childCoordinators: [CoordinatorProtocol]? { get set }
    
    var navigationController: UINavigationController { get set }
    
    func start()
    
}
