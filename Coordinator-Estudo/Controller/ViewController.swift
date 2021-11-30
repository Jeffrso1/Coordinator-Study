//
//  ViewController.swift
//  Coordinator-Estudo
//
//  Created by Jefferson Silva on 26/11/21.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    weak var coordinator: CoordinatorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func ControllerOneButton(_ sender: Any) {
        guard let coordinator = coordinator as? MainCoordinator else { return }
        coordinator.createControllerNumberOne()
    }
    
    @IBAction func ControllerTwoButton(_ sender: Any) {
        guard let coordinator = coordinator as? MainCoordinator else { return }
        coordinator.createControllerNumberTwo()
    }
    
}

