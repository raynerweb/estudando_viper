//
//  SprintInteractor.swift
//  EstudandoViper
//
//  Created by rayner on 26/06/21.
//

import Foundation
import RxSwift

protocol SprintInteractorOutput: AnyObject {
    
    func onSuccess(sprints: [Sprint])
    func onError(error: Error?)
    
}

protocol SprintInteractorInput: AnyObject {
    
    func fetchSprints()
    
}

class SprintInteractor: SprintInteractorInput {
    
    weak var output: SprintInteractorOutput?
    let dispose = DisposeBag()
    
    func fetchSprints() {
        SprintClient.get().subscribe { [weak self = self] event in
            if let sprints = event.element {
                self?.output?.onSuccess(sprints: sprints)
            }
            if let error = event.error {
                self?.output?.onError(error: error)
            }
        }.disposed(by: dispose)
    }
}
