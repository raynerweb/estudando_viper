//
//  EstoriaRouter.swift
//  EstudandoViper
//
//  Created by rayner on 28/06/21.
//

import Foundation
import UIKit

class EstoriaRouter {
    
    let view = EstoriaViewController(nibName: "EstoriaViewController", bundle: Bundle.main)
    init() {
        
    }
    
    func present(on window: UIWindow) {
        window.rootViewController = view
    }
}
