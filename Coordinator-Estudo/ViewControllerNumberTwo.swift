//
//  ViewControllerNumberTwo.swift
//  Coordinator-Estudo
//
//  Created by Jefferson Silva on 26/11/21.
//

import UIKit

class ViewControllerNumberTwo: UIViewController, HasCoordinatorProtocol {
    
    var coordinator: CoordinatorProtocol?
    
    var message: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "HEY THERE, STRANGER! THIS IS CONTROLLLER TWO"
        label.numberOfLines = 0
        label.textAlignment = .justified
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupLabel()
    }
    
    
    // MARK: - Setup
    func setupLabel() {
        view.addSubview(message)
        NSLayoutConstraint.activate([
            message.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            message.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57),
            message.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -57)
        ])
    }
}
