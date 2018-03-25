//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import AVFoundation


// 1: computação, Recife
// 2: essa é recife
// 3: ritmos locais
// 4: ritmo único e muito característico (experimente aqui)
// 5: faça você mesmo

let cfURL = Bundle.main.url(forResource: "fonts/ActionManShaded", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
