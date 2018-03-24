//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import AVFoundation


//1: computação, Recife
//2: essa é recife
//3: ritmos locais
//4: ritmo único e muito característico (experimente aqui)
//5: faça você mesmo

let cfURL = Bundle.main.url(forResource: "ActionManShaded", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)


class MyViewController : UIViewController {
    
    var samplesDrums = ["drums/Drums01", "drums/Drums02", "drums/Drums03"]
    var samplesKey = ["drums/Drums01", "drums/Drums02", "drums/Drums03"]
    var samplesBass = ["drums/Drums01", "drums/Drums02", "drums/Drums03"]

    var squares: [[MusicButton]] = [[],[],[]]
    var pressedButtons: [[Int]] = [[],[],[]]
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9568627451, blue: 0.5960784314, alpha: 1)
        
       
        
        let label = UILabel()
        label.frame = CGRect(x: 75, y: 10, width: 260, height: 70)
        label.font = UIFont(name: "ActionManShaded", size: 30)
        label.text = "BREG-O-MATIC"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        
        view.addSubview(label)
        
        // desenhando botões na tela
        var initialPositionY = 105
        var initialPositionX = 105
        var i = 0
        while initialPositionX < 250{
            while initialPositionY < 460{
                let btn = MusicButton()
                btn.pressed = 0
                btn.frame = CGRect(x: initialPositionX, y: initialPositionY, width: 40, height: 40)
                btn.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
                btn.layer.cornerRadius = 12
                squares[i].append(btn)
                btn.addTarget(self, action: #selector(tapped), for: UIControlEvents.touchUpInside)
                view.addSubview(btn)
                initialPositionY = initialPositionY + 60
            }
            initialPositionX = initialPositionX + 60
            initialPositionY = 105
            i = i + 1
        }
        
        let playButton = UIButton()
        playButton.frame = CGRect(x: 160, y: 490, width: 60, height: 30)
        playButton.setTitle("Play", for: UIControlState.normal)
        playButton.layer.cornerRadius = 10
        playButton.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        playButton.addTarget(self, action: #selector(play), for: UIControlEvents.touchUpInside)
        view.addSubview(playButton)
        
        let resetButton = UIButton()
        resetButton.frame = CGRect(x: 160, y: 550, width: 60, height: 30)
        resetButton.setTitle("Reset", for: UIControlState.normal)
        resetButton.layer.cornerRadius = 10
        resetButton.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        resetButton.addTarget(self, action: #selector(reset), for: UIControlEvents.touchUpInside)
        view.addSubview(resetButton)
        
        self.view = view
    }
    
    @objc func tapped(btn: MusicButton){
        if btn.backgroundColor == #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1){
            btn.setTitle("2", for: UIControlState.normal)
            btn.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
            btn.pressed = 2
        }else if btn.backgroundColor == #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1){
            btn.setTitle("3", for: UIControlState.normal)
            btn.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            btn.pressed = 3
        }else if btn.backgroundColor == #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1){
            btn.setTitle("", for: UIControlState.normal)
            btn.backgroundColor = #colorLiteral(red: 0.008031652309, green: 0.5721685886, blue: 0.8133963943, alpha: 1)
            btn.pressed = 0
        }else{
            btn.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
            btn.setTitle("1", for: UIControlState.normal)
            btn.pressed = 1
        }
    }
    // função que cria as sequências pra tocar a partir da numeração em pressed
    @objc func prepareToPlay(sender:UIButton){
        
    }
    
    @objc func play(sender: UIButton){
  
    }
    
    @objc func reset(){
        var j = 0
        while j < squares.count{
            for i in squares[j]{
                if i.pressed == 1{
                    i.pressed = 0
                    i.backgroundColor = #colorLiteral(red: 0.008031652309, green: 0.5721685886, blue: 0.8133963943, alpha: 1)
                    i.setTitle("", for: UIControlState.normal)
                }
            }
            j = j + 1
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
