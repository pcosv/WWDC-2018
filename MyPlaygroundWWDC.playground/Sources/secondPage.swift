import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class MyViewControllerRecife: UIViewController {
    
    public override func loadView(){
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9568627451, blue: 0.5960784314, alpha: 1)
        
        let intro = UILabel()
        intro.frame = CGRect(x: 125, y: 80, width: 500, height: 200)
        intro.font = UIFont(name: "ActionMan", size: 30)
        intro.text = "Recife is the capital of the state of Pernambuco. Besides visiting incredible places, here you can dance to a very fun musical rhythm, called \"brega\", and have fun all night long. All Recife's people love brega!"
        intro.numberOfLines = 0
        intro.lineBreakMode = .byWordWrapping
        intro.textAlignment = NSTextAlignment.center
        intro.textColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
        view.addSubview(intro)
    
        
        let show = UIButton()
        show.frame = CGRect(x: 260, y: 300, width: 230, height: 40)
        show.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        show.layer.cornerRadius = 12
        show.setTitle("Show me more", for: UIControlState.normal)
        show.titleLabel?.font =  UIFont(name: "ActionMan", size: 25)
        show.addTarget(self, action: #selector(goToBrega), for: UIControlEvents.touchUpInside)
        view.addSubview(show)
        
        
        self.view = view
    }
  
    
    @objc func goToBrega() {
        let two = MyViewControllerRecifeII()
        present(MyViewControllerRecifeII(), animated: false, completion: nil)
    }
}



