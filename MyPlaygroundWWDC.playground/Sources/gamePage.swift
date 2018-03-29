import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class MyViewControllerGame : UIViewController {
    
    var silence = "drums/Drums03"
    var samples = [["drums/Drums02", "drums/Drums01"], ["keyboard/Piano01", "keyboard/Solo02"], ["bass/acomp3_Bass", "bass/acomp7_Bass"]]
    
    var squares: [[MusicButton]] = [[],[],[]]
    var pressedButtons: [[Int]] = [[],[],[]]
    
    var queuePlayerDrums = AVQueuePlayer()
    var queuePlayerBass = AVQueuePlayer()
    var queuePlayerKeyboard = AVQueuePlayer()
    
    
    let progress = UIView()
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9568627451, blue: 0.5960784314, alpha: 1)
        
        let label = UILabel()
        label.frame = CGRect(x: 230, y: 10, width: 350, height: 70)
        label.font = UIFont(name: "ActionManShaded", size: 40)
        label.text = "BREG-O-MATIC"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        view.addSubview(label)
        // randomly select the buttons below and play!
        
        let instructions = UILabel()
        instructions.frame = CGRect(x: 110, y: 100, width: 550, height: 30)
        instructions.font = UIFont(name: "ActionMan", size: 15)
        instructions.text = "Randomly select the buttons below and play!"
        instructions.numberOfLines = 0
        instructions.lineBreakMode = .byWordWrapping
        instructions.textAlignment = NSTextAlignment.center
        instructions.textColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
        view.addSubview(instructions)
        
        // draw buttons
        var initialPositionY = 150
        var initialPositionX = 182
        var i = 0
        while initialPositionY < 300{
            while initialPositionX < 580{
                let btn = MusicButton()
                btn.pressed = 0
                btn.frame = CGRect(x: initialPositionX, y: initialPositionY, width: 40, height: 40)
                btn.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
                btn.layer.cornerRadius = 12
                squares[i].append(btn)
                pressedButtons[i].append(0)
                btn.addTarget(self, action: #selector(tapped), for: UIControlEvents.touchUpInside)
                btn.titleLabel?.font =  UIFont(name: "ActionMan", size: 25)
                view.addSubview(btn)
                initialPositionX = initialPositionX + 60
            }
            initialPositionY = initialPositionY + 60
            initialPositionX = 182
            i = i + 1
        }
        
        // play button
        let imagePlay = "icons/play.png"
        let imageP = UIImage(named: imagePlay)
        let playButton = UIImageView(image: imageP!)
        playButton.frame = CGRect(x: 610, y: 210, width: 40, height: 40)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(prepareToPlay(tapGestureRecognizer:)))
        playButton.isUserInteractionEnabled = true
        playButton.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(playButton)
        
        // icon drum
        let imageDrum = "icons/drum.png"
        let imageD = UIImage(named: imageDrum)
        let drum = UIImageView(image: imageD!)
        drum.frame = CGRect(x: 145, y: 152, width: 30, height: 30)
        view.addSubview(drum)
        
        // icon keyboard
        let imageKeyboard = "icons/key.png"
        let imageK = UIImage(named: imageKeyboard)
        let keyboard = UIImageView(image: imageK!)
        keyboard.frame = CGRect(x: 145, y: 217, width: 25, height: 25)
        view.addSubview(keyboard)
        
        // icon bass
        let imageBass = "icons/bass.png"
        let imageB = UIImage(named: imageBass)
        let bass = UIImageView(image: imageB!)
        bass.frame = CGRect(x: 145, y: 274, width: 30, height: 30)
        view.addSubview(bass)
        
        // reset button
        let imageReset = "icons/undo.png"
        let imageR = UIImage(named: imageReset)
        let resetButton = UIImageView(image: imageR!)
        resetButton.frame = CGRect(x: 610, y: 270, width: 40, height: 40)
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(reset(tapGestureRecognizer2:)))
        resetButton.isUserInteractionEnabled = true
        resetButton.addGestureRecognizer(tapGestureRecognizer2)
        view.addSubview(resetButton)
        
        self.view = view
    }
    
    @objc func tapped(btn: MusicButton){
        if btn.backgroundColor == #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 0.5){
            btn.setTitle("2", for: UIControlState.normal)
            btn.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 0.745317851)
            btn.pressed = 2
        }else if btn.backgroundColor == #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 0.745317851){
            btn.setTitle("", for: UIControlState.normal)
            btn.backgroundColor = #colorLiteral(red: 0.008031652309, green: 0.5721685886, blue: 0.8133963943, alpha: 1)
            btn.pressed = 0
        }else{
            btn.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 0.5)
            btn.setTitle("1", for: UIControlState.normal)
            btn.pressed = 1
        }
        
    }
    
    @objc func prepareToPlay(tapGestureRecognizer: UITapGestureRecognizer){
        
        var i = 0
        var j = 0
        while i < squares.count{
            while j < squares[i].count{
                if squares[i][j].pressed == 0{
                    let urlPath = Bundle.main.path(forResource: silence, ofType:"wav")
                    let fileURL = NSURL(fileURLWithPath:urlPath!)
                    let playerItem = AVPlayerItem(url:fileURL as URL)
                    if i == 0{
                        queuePlayerDrums.insert(playerItem, after:nil)
                    }else if i == 1{
                        queuePlayerKeyboard.insert(playerItem, after:nil)
                    }else if i == 2{
                        queuePlayerBass.insert(playerItem, after:nil)
                    }
                }else{
                    let urlPath = Bundle.main.path(forResource: samples[i][(squares[i][j].pressed!) - 1], ofType:"wav")
                    let fileURL = NSURL(fileURLWithPath:urlPath!)
                    let playerItem = AVPlayerItem(url:fileURL as URL)
                    let playerItem2 = AVPlayerItem(url:fileURL as URL)
                    if i == 0{
                        queuePlayerDrums.insert(playerItem, after:nil)
                    }else if i == 1{
                        queuePlayerKeyboard.insert(playerItem, after:nil)
                    }else if i == 2{
                        queuePlayerBass.insert(playerItem, after:nil)
                        queuePlayerBass.insert(playerItem2, after:nil)
                    }
                }
                j = j + 1
            }
            i = i + 1
            j = 0
        }
        
        play(drums: queuePlayerDrums, bass: queuePlayerBass, key: queuePlayerKeyboard)
    }
    
    // music progress
    @objc func musicProgress(){
        var p = 197
        progress.frame = CGRect(x: p, y: 320, width: 10, height: 10)
        progress.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        progress.layer.cornerRadius = 5
        view.addSubview(progress)
        var i = 0
        while i < 6{
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6*(i + 1))) {
                UIView.animate(withDuration: 0.5) {
                    p = p + 60
                    self.progress.frame = CGRect(x: p, y: 320, width: 10, height: 10)
                }
            }
            i = i + 1
        }
    }
    
    @objc func play(drums: AVQueuePlayer, bass: AVQueuePlayer, key: AVQueuePlayer){
        drums.play()
        bass.play()
        key.play()
        musicProgress()
    }
    
    @objc func reset(tapGestureRecognizer2: UITapGestureRecognizer){
        progress.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9568627451, blue: 0.5960784314, alpha: 1)
        progress.frame = CGRect(x: 197, y: 320, width: 10, height: 10)
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
