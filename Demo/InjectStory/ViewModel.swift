//
//  ViewModel.swift
//  InjectStory
//
//  Created by Maciej Gad on 30.10.2016.
//  Copyright © 2016 Maciej Gad. All rights reserved.
//

import Foundation

protocol AnimalSound {
    func makeSound() -> String
}

class DogViewModel:AnimalSound {
    func makeSound() -> String {
        return "woof, woof"
    }
}

class CatViewModel: AnimalSound {
    func makeSound() -> String{
        return "mow"
    }
}
