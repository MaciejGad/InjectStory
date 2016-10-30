//
//  InjectionFabric.swift
//  InjectStory
//
//  Created by Maciej Gad on 30.10.2016.
//  Copyright © 2016 Maciej Gad. All rights reserved.
//

import Foundation

protocol Injectable {
    static func injection(name:String) -> ViewModel
}


class InjectionFabric {
    
    class func inject<T>(name n:String, in injectable:T.Type) -> ViewModel where T:Injectable {
        let name = nameOfViewModel(name: n, in: T.self)
        if let model = sharedInstance.listOfReplacements[name] {
            sharedInstance.listOfReplacements.removeValue(forKey: name)
            return model
        }
        return injectable.injection(name: n)
    }
    
    class func replaceViewModel<T>(name n:String, in injectable:T.Type, with model:ViewModel) where T:Injectable {
        let name = nameOfViewModel(name: n, in: T.self)
        print(name, ": ", model)
        sharedInstance.listOfReplacements[name] = model
    }
    
    private class func nameOfViewModel<T>(name n:String, in injectable:T.Type) -> String {
        return String(describing: T.self) + "." + n
    }
    
    private var listOfReplacements = Dictionary<String, ViewModel>()
    private static let sharedInstance = InjectionFabric()
}

//class InjectionSyringe<M:ViewModel> {
//    func inject() -> M {
//        return M()
//    }
//}
