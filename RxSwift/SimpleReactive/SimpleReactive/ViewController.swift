//
//  ViewController.swift
//  SimpleReactive
//
//  Created by Hari Kunwar on 7/15/18.
//  Copyright © 2018 Learning. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    let disposeBag = DisposeBag()
    var name: Variable<String> = Variable("Jon")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Observable
        name.asObservable()
            .bind(to: self.nameLabel.rx.text)
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeName(_ sender: Any) {
        let alert = UIAlertController(title: "Name Change", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            if let textInput = alert.textFields?.first?.text {
                self.name.value = textInput
            }
        }
        
        alert.addAction(okAction)
        
        alert.addTextField()
        present(alert, animated: true)
    }
}

