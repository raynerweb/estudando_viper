//
//  NavigationBuilder.swift
//  EstudandoViper
//
//  Created by rayner on 03/07/21.
//

import Foundation
import UIKit

class NavigationBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootView)
        
        navigationController.navigationBar.barTintColor = .systemTeal
        navigationController.navigationBar.backgroundColor = .systemTeal
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.isTranslucent = false
//        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
