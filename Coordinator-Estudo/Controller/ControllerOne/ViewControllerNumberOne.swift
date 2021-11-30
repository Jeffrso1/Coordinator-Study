//
//  ViewControllerNumberOne.swift
//  Coordinator-Estudo
//
//  Created by Jefferson Silva on 26/11/21.
//

import UIKit

class ViewControllerNumberOne: UIViewController, Storyboarded {
    
    weak var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        coordinator?.finish()
    }
}
