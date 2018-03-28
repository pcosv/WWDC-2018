import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class MyViewControllerGame : UIViewController {
    
    var silence = "drums/Drums03"
    //    var samplesDrums = ["drums/Drums01", "drums/Drums02"]
    //    var samplesKey = ["keyboard/Solo01", "keyboard/Solo02", "keyboard/Piano01"]
    //    var samplesBass = ["bass/acomp2_Bass", "bass/acomp3_Bass", "bass/acomp4_Bass"]
    var samples = [["drums/Drums01", "drums/Drums02"], ["keyboard/Solo01", "keyboard/Solo02"], ["bass/acomp3_Bass", "bass/acomp7_Bass"]]
    
    var squares: [[MusicButton]] = [[],[],[]]
    var pressedButtons: [[Int]] = [[],[],[]]
    
    var queuePlayerDrums = AVQueuePlayer()
    var queuePlayerBass = AVQueuePlayer()
    var queuePlayerKeyboard = AVQueuePlayer()
    
    var lastDrum: MusicButton?
    var lastBass: MusicButton?
    var lastKeyboard: MusicButton?
    
    public override func loadView() {
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
                pressedButtons[i].append(0)
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
        playButton.addTarget(self, action: #selector(prepareToPlay), for: UIControlEvents.touchUpInside)
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
            btn.setTitle("", for: UIControlState.normal)
            btn.backgroundColor = #colorLiteral(red: 0.008031652309, green: 0.5721685886, blue: 0.8133963943, alpha: 1)
            btn.pressed = 0
        }else{
            btn.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
            btn.setTitle("1", for: UIControlState.normal)
            btn.pressed = 1
        }
        
    }
    
    @objc func prepareToPlay(sender:UIButton){
        
        var i = 0
        var j = 0
        while i < squares.count{
            while j < squares[i].count{
                if squares[i][j].pressed == 0{
                    let urlPath = Bundle.main.path(forResource: silence, ofType:"wav")
                    let fileURL = NSURL(fileURLWithPath:urlPath!)
                    let playerItem = AVPlayerItem(url:fileURL as URL)
                    queuePlayerDrums.insert(playerItem, after:nil)
                }else{
                    let urlPath = Bundle.main.path(forResource: samples[i][(squares[i][j].pressed!) - 1], ofType:"wav")
                    let fileURL = NSURL(fileURLWithPath:urlPath!)
                    let playerItem = AVPlayerItem(url:fileURL as URL)
                    if i == 0{
                        queuePlayerDrums.insert(playerItem, after:nil)
                    }else if i == 1{
                        queuePlayerKeyboard.insert(playerItem, after:nil)
                    }else if i == 2{
                        queuePlayerBass.insert(playerItem, after:nil)
                    }
                }
                j = j + 1
            }
            i = i + 1
            j = 0
        }

        play(drums: queuePlayerDrums, bass: queuePlayerBass, key: queuePlayerKeyboard)
    }
    
    @objc func play(drums: AVQueuePlayer, bass: AVQueuePlayer, key: AVQueuePlayer){
//        if playButton.text == "Play"{
//            playButton.setTitle = "Pause"
            drums.play()
            bass.play()
            key.play()
//        }else{
//            playButton.setTitle = "Play"
//            // PAREI AQUI
//        }
        
    }
    
    @objc func reset(){
        queuePlayerBass.pause()
        queuePlayerKeyboard.pause()
        queuePlayerDrums.pause()
        queuePlayerBass.removeAllItems()
        queuePlayerKeyboard.removeAllItems()
        queuePlayerDrums.removeAllItems()
        var j = 0
        while j < squares.count{
            for i in squares[j]{
                if i.pressed == 1 || i.pressed == 2 {
                    i.pressed = 0
                    i.backgroundColor = #colorLiteral(red: 0.008031652309, green: 0.5721685886, blue: 0.8133963943, alpha: 1)
                    i.setTitle("", for: UIControlState.normal)
                }
            }
            j = j + 1
        }
    }
}
