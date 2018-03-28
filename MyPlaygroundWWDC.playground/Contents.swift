//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import AVFoundation


let fontShaded = Bundle.main.url(forResource: "fonts/ActionManShaded", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(fontShaded, CTFontManagerScope.process, nil)

let font = Bundle.main.url(forResource: "fonts/ActionMan", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(font, CTFontManagerScope.process, nil)

let fontBold = Bundle.main.url(forResource: "fonts/ActionManBold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(fontBold, CTFontManagerScope.process, nil)


// Present the view controller in the Live View window
let a = MyViewControllerStart()
a.preferredContentSize = CGSize(width: 900, height: 450)
PlaygroundPage.current.liveView = a

