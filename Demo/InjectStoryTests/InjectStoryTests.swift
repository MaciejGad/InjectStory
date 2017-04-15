//
//  InjectStoryTests.swift
//  InjectStoryTests
//
//  Created by Maciej Gad on 30.10.2016.
//  Copyright © 2016 Maciej Gad. All rights reserved.
//

import XCTest
@testable import InjectStory

class InjectStoryTests: XCTestCase {
    
    func testIfViewControllerCallMowMrthod() {
        //given
        let spy = AnimalSoundSpy()
        //override value returned by viewModelInjection
        ViewController.viewModelInjection.overrideOnce = { spy }
        let sut = viewController()

        //when
        _ = sut.view
        
        //then
        XCTAssertTrue(spy.makeSoundCalled)
    }
    
    func testIfViewControllerSetLabelTitle() {
        //given
        let givenSound = "meow meow I'm a cow"
        let fake = AnimalSoundFake(sound: givenSound)
        //override value returned by viewModelInjection
        ViewController.viewModelInjection.overrideOnce = { fake }
        let sut = viewController()
        
        //when
        _ = sut.view
        
        //then
        guard let soudText = sut.soundLabel.text else {
            XCTFail()
            return
        }
        XCTAssertEqual(soudText, givenSound)
        
    }
    
    
    private func viewController() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "viewController") as! ViewController
    }
    
}



class AnimalSoundSpy: AnimalSound {
    var makeSoundCalled = false
    func makeSound() -> String{
        makeSoundCalled = true
        return ""
    }
}

class AnimalSoundFake: AnimalSound {
    let sound:String
    
    init(sound:String) {
        self.sound = sound
    }
    
    func makeSound() -> String {
        return sound
    }
}
