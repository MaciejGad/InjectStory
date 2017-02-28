//
//  ViewController.swift
//  InjectStory
//
//  Created by Maciej Gad on 30.10.2016.
//  Copyright © 2016 Maciej Gad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let viewModelInjection = Injection<CatViewModelProtocol>({
        //return DogViewModel()
        //returning wrong class in impossible
        return CatViewModel()
    })
    
    let viewModel:CatViewModelProtocol = viewModelInjection.inject()

    @IBOutlet weak var mowLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mowLabel.text = viewModel.mow()
    }
}

