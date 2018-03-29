import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class MyViewControllerRecifeII: UIViewController {
    var samples1 = ["drums/Drums02", "keyboard/Solo01", "bass/acomp3_Bass"]
    
    var queuePlayerDrumsExample = AVQueuePlayer()
    var queuePlayerBassExample = AVQueuePlayer()
    var queuePlayerKeyboardExample = AVQueuePlayer()
    
    public override func loadView(){
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9568627451, blue: 0.5960784314, alpha: 1)
        
        let clickLabel = UILabel()
        clickLabel.frame = CGRect(x: 100, y: 20, width: 550, height: 30)
        clickLabel.font = UIFont(name: "ActionMan", size: 15)
        clickLabel.text = "Click on these beautiful landscapes of Recife and know the Brega"
        clickLabel.numberOfLines = 0
        clickLabel.lineBreakMode = .byWordWrapping
        clickLabel.textAlignment = NSTextAlignment.center
        clickLabel.textColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        view.addSubview(clickLabel)
        
        let tryButton = UIButton()
        tryButton.frame = CGRect(x: 360, y: 370, width: 60, height: 40)
        tryButton.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
        tryButton.layer.cornerRadius = 12
        tryButton.setTitle("Try", for: UIControlState.normal)
        tryButton.titleLabel?.font =  UIFont(name: "ActionMan", size: 25)
        tryButton.addTarget(self, action: #selector(tryYourself), for: UIControlEvents.touchUpInside)
        view.addSubview(tryButton)
        
        // recife 1
        let image1 = "images/marcozero.jpg"
        let image = UIImage(named: image1)
        let recife1 = UIImageView(image: image!)
        recife1.frame = CGRect(x: 70, y: 70, width: 300, height: 185)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(playExample(tapGestureRecognizer:)))
        recife1.isUserInteractionEnabled = true
        recife1.addGestureRecognizer(tapGestureRecognizer)
        
        recife1.layer.borderWidth = 8
        recife1.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        view.addSubview(recife1)
        
        let label1 = UILabel()
        label1.frame = CGRect(x: 140, y: 255, width: 130, height: 20)
        label1.font = UIFont(name: "ActionMan", size: 12)
        label1.text = "Historic buildings"
        label1.numberOfLines = 0
        label1.lineBreakMode = .byWordWrapping
        label1.textAlignment = NSTextAlignment.center
        label1.textColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        view.addSubview(label1)
        
        
        // recife 2
        let image2 = "images/recife.jpg"
        let imagem = UIImage(named: image2)
        let recife2 = UIImageView(image: imagem!)
        recife2.frame = CGRect(x: 400, y: 70, width: 300, height: 185)
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(playExample(tapGestureRecognizer:)))
        recife2.isUserInteractionEnabled = true
        recife2.addGestureRecognizer(tapGestureRecognizer2)
        
        recife2.layer.borderWidth = 8
        recife2.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        view.addSubview(recife2)
        
        let label2 = UILabel()
        label2.frame = CGRect(x: 490, y: 257, width: 110, height: 20)
        label2.font = UIFont(name: "ActionMan", size: 12)
        label2.text = "Panoramic view of the city"
        label2.numberOfLines = 0
        label2.lineBreakMode = .byWordWrapping
        label2.textAlignment = NSTextAlignment.center
        label2.textColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        view.addSubview(label2)
        
        let goToGame = UILabel()
        goToGame.frame = CGRect(x: 110, y: 320, width: 550, height: 30)
        goToGame.font = UIFont(name: "ActionMan", size: 15)
        goToGame.text = "Do you want to make your own brega?"
        goToGame.numberOfLines = 0
        goToGame.lineBreakMode = .byWordWrapping
        goToGame.textAlignment = NSTextAlignment.center
        goToGame.textColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
        view.addSubview(goToGame)
        
        self.view = view
    }
    
    @objc func playExample(tapGestureRecognizer: UITapGestureRecognizer){
        
        let urlPath = Bundle.main.path(forResource: samples1[0], ofType:"wav")
        let fileURL = NSURL(fileURLWithPath:urlPath!)
        let playerItem = AVPlayerItem(url:fileURL as URL)
        queuePlayerDrumsExample.insert(playerItem, after:nil)
        
        let urlPath2 = Bundle.main.path(forResource: samples1[1], ofType:"wav")
        let fileURL2 = NSURL(fileURLWithPath:urlPath2!)
        let playerItem2 = AVPlayerItem(url:fileURL2 as URL)
        queuePlayerKeyboardExample.insert(playerItem2, after:nil)
        
        let urlPath3 = Bundle.main.path(forResource: samples1[1], ofType:"wav")
        let fileURL3 = NSURL(fileURLWithPath:urlPath3!)
        let playerItem3 = AVPlayerItem(url:fileURL3 as URL)
        queuePlayerKeyboardExample.insert(playerItem3, after:nil)
        
        let urlPath4 = Bundle.main.path(forResource: samples1[2], ofType:"wav")
        let fileURL4 = NSURL(fileURLWithPath:urlPath4!)
        let playerItem4 = AVPlayerItem(url:fileURL4 as URL)
        queuePlayerBassExample.insert(playerItem4, after:nil)
        
        let urlPath5 = Bundle.main.path(forResource: samples1[2], ofType:"wav")
        let fileURL5 = NSURL(fileURLWithPath:urlPath5!)
        let playerItem5 = AVPlayerItem(url:fileURL5 as URL)
        queuePlayerBassExample.insert(playerItem5, after:nil)
        
        queuePlayerDrumsExample.play()
        queuePlayerBassExample.play()
        queuePlayerKeyboardExample.play()
        
    }
    
    
    @objc func tryYourself() {
        let game = MyViewControllerGame()
        present(MyViewControllerGame(), animated: false, completion: nil)
    }
}



