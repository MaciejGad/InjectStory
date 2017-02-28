//
//  Injection.swift
//  InjectStory
//
//  Created by Maciej Gad on 30.10.2016.
//  Copyright © 2016 Maciej Gad. All rights reserved.
//

import Foundation

class Injection<M> {
    let defaultInit:(() -> M)
    var overrideOnce:(() -> M)?
    func inject() -> M {
        if let overrideOnce = overrideOnce {
            self.overrideOnce = nil
            return overrideOnce()
        }
        return defaultInit()
    }
    
    init(_ defaultInit:@escaping ()->M) {
        self.defaultInit = defaultInit
    }
}
