//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import AVFoundation

class MyViewController : UIViewController {
  
  var samples = ["acomp2_Bass", "acomp2_Hit", "acomp2_Synth", "acomp2_Synth2", "acomp2_SynthBrass", "acomp3_Bass", "acomp4_Bass", "Drums01", "Drums02", "Drums03", "acomp2_Synth", "acomp2_Synth2", "acomp2_SynthBrass", "acomp3_Bass", "acomp4_Bass", "Drums01", "Drums02", "Drums03"]
  var squares = [MusicButton]()
  var pressedSquares = [MusicButton]()
  override func loadView() {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9568627451, blue: 0.5960784314, alpha: 1)
    
    //    let br = "brazil.jpg"
    //    let brazil = UIImage(named: br)
    //    let imageView = UIImageView(image: brazil)
    //    imageView.frame = CGRect(x: 50, y: 150, width: 250, height: 250)
    //    view.addSubview(imageView)
    
    let cfURL = Bundle.main.url(forResource: "Action_Man", withExtension: "ttf")! as CFURL
    CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
    
    let label = UILabel()
    label.frame = CGRect(x: 120, y: 10, width: 150, height: 70)
    label.font = UIFont(name: "Action_Man", size: 20)
    label.text = "BREG-O-MATIC"
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
    
    view.addSubview(label)
    
    
    var initialPositionY = 105
    var initialPositionX = 105
    var i = 0
    while initialPositionX < 250 && i < 18{
      while initialPositionY < 460{
        let square = MusicButton()
        square.frame = CGRect(x: initialPositionX, y: initialPositionY, width: 40, height: 40)
        square.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
        square.layer.cornerRadius = 10
        do {
          let audioPath = Bundle.main.path(forResource: samples[i], ofType: "wav")
          try square.sample = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
          // ERROR
          print("erro")
        }
        i = i + 1
        squares.append(square)
        square.addTarget(self, action: #selector(tapped), for: UIControlEvents.touchUpInside)
        view.addSubview(square)
        initialPositionY = initialPositionY + 60
      }
      initialPositionX = initialPositionX + 60
      initialPositionY = 105
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
      var i = 0
      while i < pressedSquares.count{
        
        if pressedSquares[i] == btn{
          pressedSquares.remove(at: i)
          break
        }
        i = i + 1
      }
      btn.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
    }else{
      btn.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
      pressedSquares.append(btn)
    }
  }
  
  @objc func play(sender: UIButton){
    for i in pressedSquares{
      //i.sample?.prepareToPlay()
      i.sample?.play()
    }
  }
  
  @objc func reset(){
    pressedSquares = []
    var j = 0
    while j < squares.count{
      squares[j].backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
      j = j + 1
    }
  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
