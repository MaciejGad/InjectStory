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

class SpecificViewModel: ViewModel {
    required init() {
        
    }
}

class TestViewModel: ViewModel {
    required init() {
        
    }
}
