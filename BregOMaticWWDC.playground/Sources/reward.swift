import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class MyViewControllerReward: UIViewController {
    
    public override func loadView(){
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9568627451, blue: 0.5960784314, alpha: 1)

        
        // recife 1
        let rec1 = "images/audience.jpg"
        let reci1 = UIImage(named: rec1)
        let recife1 = UIImageView(image: reci1!)
        recife1.frame = CGRect(x: 70, y: 25, width: 300, height: 185)
        recife1.layer.borderWidth = 8
        recife1.layer.borderColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
        view.addSubview(recife1)
        
        let label1 = UILabel()
        label1.frame = CGRect(x: 140, y: 210, width: 130, height: 20)
        label1.font = UIFont(name: "ActionMan", size: 12)
        label1.text = "Santa Isabel Theatre"
        label1.numberOfLines = 0
        label1.lineBreakMode = .byWordWrapping
        label1.textAlignment = NSTextAlignment.center
        label1.textColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        view.addSubview(label1)
        
        
        // recife 2
        let rec2 = "images/carnival.jpg"
        let reci2 = UIImage(named: rec2)
        let recife2 = UIImageView(image: reci2!)
        recife2.frame = CGRect(x: 400, y: 25, width: 300, height: 185)
        recife2.layer.borderWidth = 8
        recife2.layer.borderColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
        view.addSubview(recife2)
        
        let label2 = UILabel()
        label2.frame = CGRect(x: 450, y: 210, width: 200, height: 20)
        label2.font = UIFont(name: "ActionMan", size: 12)
        label2.text = "People dancing frevo at carnival"
        label2.numberOfLines = 0
        label2.lineBreakMode = .byWordWrapping
        label2.textAlignment = NSTextAlignment.center
        label2.textColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        view.addSubview(label2)
        
        
        // recife 3
        let rec3 = "images/aurora.jpg"
        let reci3 = UIImage(named: rec3)
        let recife3 = UIImageView(image: reci3!)
        recife3.frame = CGRect(x: 70, y: 230, width: 300, height: 185)
        recife3.layer.borderWidth = 8
        recife3.layer.borderColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
        view.addSubview(recife3)
        
        let label3 = UILabel()
        label3.frame = CGRect(x: 110, y: 417, width: 200, height: 20)
        label3.font = UIFont(name: "ActionMan", size: 12)
        label3.text = "Historic buildings (Aurora Street)"
        label3.numberOfLines = 0
        label3.lineBreakMode = .byWordWrapping
        label3.textAlignment = NSTextAlignment.center
        label3.textColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        view.addSubview(label3)
        
        
        // recife 4
        let rec4 = "images/beach.jpg"
        let reci4 = UIImage(named: rec4)
        let recife4 = UIImageView(image: reci4!)
        recife4.frame = CGRect(x: 400, y: 230, width: 300, height: 185)
        recife4.layer.borderWidth = 8
        recife4.layer.borderColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
        view.addSubview(recife4)
        
        let label4 = UILabel()
        label4.frame = CGRect(x: 490, y: 417, width: 110, height: 20)
        label4.font = UIFont(name: "ActionMan", size: 12)
        label4.text = "Sunrise on Boa Viagem beach"
        label4.numberOfLines = 0
        label4.lineBreakMode = .byWordWrapping
        label4.textAlignment = NSTextAlignment.center
        label4.textColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        view.addSubview(label4)
     
        
        
        self.view = view
    }
}
