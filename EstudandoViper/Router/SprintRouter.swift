//
//  SprintRouter.swift
//  EstudandoViper
//
//  Created by rayner on 28/06/21.
//

import Foundation
import UIKit

class SprintRouter {
    
    
    let view = SprintViewController(nibName: "SprintViewController", bundle: Bundle.main)
    let interactor = SprintInteractor()
    let presenter = SprintPresenter()
    
    
    init() {
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
    }
    
    func present(on window: UIWindow) {
        window.rootViewController = view
    }
}
