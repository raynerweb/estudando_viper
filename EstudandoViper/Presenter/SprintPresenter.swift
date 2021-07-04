//
//  SprintPresenter.swift
//  EstudandoViper
//
//  Created by rayner on 26/06/21.
//

import Foundation
import RxSwift
import RxSwiftExt
import RxCocoa

protocol SprintPresenterToView: AnyObject {
    
    var fetchedSprints: Observable<[Sprint]> { get }
    func viewDidLoad()
    
}


class SprintPresenter {
    
    weak var view: SprintViewToPresenter?
    var interactor: SprintInteractorInput?
    let dispose = DisposeBag()
    let sprints = BehaviorRelay<[Sprint]>(value: [])
    
    func bind() {
        if let view = self.view {
            view.setLoading(loading: true)
            view.fetchSprints().bind { chupeta in
                self.interactor?.fetchSprints()
            }.disposed(by: dispose)
        }
    }
}

extension SprintPresenter: SprintPresenterToView {
    
    var fetchedSprints: Observable<[Sprint]> {
        return sprints.asObservable()
    }
    
    func viewDidLoad() {
        bind()
    }
    
}

extension SprintPresenter: SprintInteractorOutput {
    
    func onSuccess(sprints: [Sprint]) {
        view?.setLoading(loading: false)
        self.sprints.accept(sprints)
    }
    
    func onError(error: Error?) {
        view?.setLoading(loading: false)
    }

}
