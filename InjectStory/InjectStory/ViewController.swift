//
//  ViewController.swift
//  InjectStory
//
//  Created by Maciej Gad on 30.10.2016.
//  Copyright © 2016 Maciej Gad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewModel:ViewModel
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = InjectionFabric.inject(name: "viewModel", in: ViewController.self)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ViewController:Injectable {

    internal static func injection(name:String) -> ViewModel {
        return SpecificViewModel()
    }
    
}
