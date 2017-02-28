//
//  ViewModel.swift
//  InjectStory
//
//  Created by Maciej Gad on 30.10.2016.
//  Copyright © 2016 Maciej Gad. All rights reserved.
//

import Foundation

class DogViewModel {
    func woof() -> String {
        return "woof, woof"
    }
}

protocol CatViewModelProtocol {
    func mow() -> String
}

class CatViewModel: CatViewModelProtocol {
    func mow() -> String{
        return "mow"
    }
}

class TestViewModel: CatViewModelProtocol {
    func mow() -> String{
        return "mow test"
    }
}
