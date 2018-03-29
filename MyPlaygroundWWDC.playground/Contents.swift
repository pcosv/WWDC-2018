//:# Welcome to my Playground!
//: Hello! In this Playground I will show a little of the culture of my beloved city, Recife, capital of the Brazilian state of Pernambuco.
//: The people of Recife are extremely happy, kind and receptive. Also, we love Carnival!
//: The Carnival of Brazil is an annual Brazilian festival held between the Friday afternoon before Ash Wednesday and Ash Wednesday at noon, which marks the beginning of Lent, the forty-day period before Easter.
//: Recife is marked by the parade of the largest carnival block in the world, the Rooster of the Dawn. In this block, there is a great variety of musical rhythms and happiness.
//: I chose to talk about "brega" (wait just a little bit, you'll know what this is) because it's a unique peculiarity of Recife, you will not find anywhere else on the planet.
//:## Let's go!
//: _____________________________________________________________________________________
import UIKit
import PlaygroundSupport
import AVFoundation

let fontShaded = Bundle.main.url(forResource: "fonts/ActionManShaded", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(fontShaded, CTFontManagerScope.process, nil)

let font = Bundle.main.url(forResource: "fonts/ActionMan", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(font, CTFontManagerScope.process, nil)


// Present the view controller in the Live View window
let a = MyViewControllerStart()
a.preferredContentSize = CGSize(width: 900, height: 450)
PlaygroundPage.current.liveView = a

