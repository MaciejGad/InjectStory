//
//  ViewModel.swift
//  InjectStory
//
//  Created by Maciej Gad on 30.10.2016.
//  Copyright © 2016 Maciej Gad. All rights reserved.
//

import Foundation

protocol ViewModel {
    init()
}

class ZupaViewModel:ViewModel {
    required init() {}
}

protocol CatViewModel: ViewModel {
    func mow() -> String
}

class SpecificViewModel: CatViewModel {
    required init() {}
    
    func mow()-> String{
        return "mow"
    }
}

class TestViewModel: CatViewModel {
    required init() {}
    func mow()-> String{
        return "mow test"
    }
}
