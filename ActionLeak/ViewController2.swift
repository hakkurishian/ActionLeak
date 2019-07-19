//
//  ViewController2.swift
//  ActionLeak
//
//  Created by Chris on 19.07.19.
//  Copyright © 2019 huck. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Action

class ViewController2 : UIViewController{
    lazy var action = Action<Void,Void>{_ in
        return .just(())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        action.execute(())
    }
    
}
