//
//  EstoriaViewController.swift
//  EstudandoViper
//
//  Created by rayner on 28/06/21.
//

import UIKit

class EstoriaViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Estorias"
    }

    @IBAction func nextButton(_ sender: Any) {
        let tarefaViewController = TarefaViewController()
        navigationController?.pushViewController(tarefaViewController, animated: true)
    }

}
