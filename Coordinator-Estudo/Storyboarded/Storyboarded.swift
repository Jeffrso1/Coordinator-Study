//
//  Storyboarded.swift
//  Coordinator-Estudo
//
//  Created by Jefferson Silva on 26/11/21.
//

import UIKit

protocol Storyboarded {
    
    static func instantiate() -> Self
    
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        
        // O primeiro passo é pegar o nome desse ViewController.
        let fullName = NSStringFromClass(self)
        
        // Essa classe vem no formato App.Classe e só queremos depois do ponto.
        let className = fullName.components(separatedBy: ".")[1]
        
        // Agora devemos inicializar o Storyboard correto.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Por fim, só basta instanciar o controller correto.
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
        
    }
}
