//
//  ViewController.swift
//  InjectStory
//
//  Created by Maciej Gad on 30.10.2016.
//  Copyright © 2016 Maciej Gad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let viewModelInjection = Injection<AnimalSound>(CatViewModel())
    
    let viewModel = viewModelInjection.inject()

    @IBOutlet weak var soundLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        soundLabel.text = viewModel.makeSound()
    }
}

