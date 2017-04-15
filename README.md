# InjectStory  [![Build Status](https://travis-ci.org/MaciejGad/InjectStory.svg?branch=master)](https://travis-ci.org/MaciejGad/InjectStory)
Simple dependency injection framework for Swift

<img src="https://maciejgad.github.io/InjectStory/InjectStory.png">

# Usage 

- create a protocol
```swift
protocol AnimalSound {
    func makeSound() -> String
}
```
- add implementation for protocol
```swift
class CatViewModel: AnimalSound {
    func makeSound() -> String{
        return "meow"
    }
}
```
- add static variable to class where you want use dependency injection. Remember to use protocol type as `Injection` type.
```swift 
static let viewModelInjection = Injection<AnimalSound>(CatViewModel())
```
- inject dependency
```swift 
let viewModel = viewModelInjection.inject()
```
- if you want different view model object use
```swift 
ViewController.viewModelInjection.overrideOnce = { MockAnimalSound() }
```
(where `MockAnimalSound` must implement `AnimalSound` protocol)

# Example

```swift
//  ViewController.swift
import UIKit
import InjectStory

class ViewController: UIViewController {
    
    static let viewModelInjection = Injection<AnimalSound>(CatViewModel())
    let viewModel = viewModelInjection.inject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        soundLabel.text = viewModel.makeSound()
    }

    @IBOutlet weak var soundLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

````

```swift
// CatViewModel.swift
import Foundation

protocol AnimalSound {
    func makeSound() -> String
}

class CatViewModel: AnimalSound {
    func makeSound() -> String{
        return "meow"
    }
}
```

```swift
//  ViewControllerTests.swift

import XCTest
@testable import YourApp

class ViewControllerTests: XCTestCase {
    func testIfViewControllerCallsMeowMethod() {
        //given
        let spy = AnimalSoundSpy()
        //override value returned by viewModelInjection
        ViewController.viewModelInjection.overrideOnce = { spy }
        //create system under test
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "viewController") as! ViewController

        //when
        _ = sut.view //to call viewDidLoad
        
        //then
        XCTAssertTrue(spy.makeSoundCalled)
    }
}

//mock class
class AnimalSoundSpy: AnimalSound {
    var makeSoundCalled = false
    func makeSound() -> String{
        makeSoundCalled = true
        return ""
    }
}
```
