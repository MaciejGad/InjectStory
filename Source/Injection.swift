//
//  Injection.swift
//  InjectStory
//
//  Created by Maciej Gad on 30.10.2016.
//  Copyright © 2016 Maciej Gad. All rights reserved.
//

import Foundation

public class Injection<M> {
    let defaultInit:(() -> M)
    public var overrideOnce:(() -> M)?
    public var override:(() -> M)?
    
    public func inject() -> M {
        if let override = override {
            return override()
        }
        if let overrideOnce = overrideOnce {
            self.overrideOnce = nil
            return overrideOnce()
        }
        return defaultInit()
    }
    
    public init(_ defaultInit: @escaping @autoclosure ()->M) {
        self.defaultInit = defaultInit
    }
    
    public func reset() {
        override = nil
        overrideOnce = nil
    }
}

public class ArgumentedInjection<M,N> {
    let defaultInit:((N) -> M)
    public var overrideOnce:((N) -> M)?
    public var override:((N) -> M)?
    
    public func inject(argument:N) -> M {
        if let override = override {
            return override(argument)
        }
        if let overrideOnce = overrideOnce {
            self.overrideOnce = nil
            return overrideOnce(argument)
        }
        return defaultInit(argument)
    }
    
    public init(_ defaultInit: @escaping (N)->M) {
        self.defaultInit = defaultInit
    }
    
    public func reset() {
        override = nil
        overrideOnce = nil
    }
}
