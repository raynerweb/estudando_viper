//
//  SprintViewController.swift
//  EstudandoViper
//
//  Created by rayner on 27/06/21.
//

import UIKit
import RxSwift
import RxSwiftExt
import RxCocoa

protocol SprintViewToPresenter: AnyObject {
    
    func fetchSprints() -> Observable<[Sprint]?>
    func setLoading(loading: Bool)
    
}

class SprintViewController: UIViewController {
    
    var presenter: SprintPresenterToView!
    
    let dispose = DisposeBag()
    
    var sprints = BehaviorRelay<[Sprint]?>(value: []) {
        didSet {
            print(sprints)
        }
    }

    @IBOutlet weak var sprintNameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        bind()
    }
    
    func setupViews() {
        title = "Sprints"
        view.backgroundColor = .systemTeal
    }
    
    func bind() {
        presenter.fetchedSprints.bind { [weak self ] sprints in
            self?.sprints.accept(sprints)
        }.disposed(by: dispose)
        
        presenter.viewDidLoad()
        
        
    }
    
    @IBAction func findButton(_ sender: Any) {
        let estoriaViewController = EstoriaViewController()
        navigationController?.pushViewController(estoriaViewController, animated: true)
    }

}

extension SprintViewController : SprintViewToPresenter {
    
    func fetchSprints() -> Observable<[Sprint]?> {
        return sprints.asObservable()
    }
    
    func setLoading(loading: Bool) {
        if loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
}
