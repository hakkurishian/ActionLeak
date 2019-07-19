//
//  ViewController.swift
//  ActionLeak
//
//  Created by Chris on 19.07.19.
//  Copyright © 2019 huck. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var button = UIButton(type: .system)
        button.setTitle("go to child", for: .normal)
        button.rx.tap.subscribe(onNext: {_ in
            self.performSegue(withIdentifier: "showChild", sender: self)
        }).disposed(by: bag)
        button.frame = CGRect(origin: self.view.center, size:CGSize(width: 150, height: 50))
        
    
        self.view.addSubview(button)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChild" , let s = segue.destination as? ViewController2 {
            s.action.executionObservables.switchLatest().debug("segue subscription").subscribe(onNext:{_ in
                print("subscriber")
            }).disposed(by: bag)
        }
    }


}

