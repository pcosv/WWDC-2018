//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import AVFoundation


let cfURL = Bundle.main.url(forResource: "fonts/ActionManShaded", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = VC()
