import Foundation
import UIKit

public class MyViewControllerStart: UIViewController {
    
    public override func loadView(){
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9568627451, blue: 0.5960784314, alpha: 1)
        
        let label = UILabel()
        label.frame = CGRect(x: 125, y: 80, width: 500, height: 200)
        label.font = UIFont(name: "ActionMan", size: 40)
        label.text = "Do you want to get to know a special part of Brazil, full of good music, lovely landscapes and fun people?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = NSTextAlignment.center
        label.textColor = #colorLiteral(red: 0.01176470588, green: 0.5725490196, blue: 0.8117647059, alpha: 1)
        view.addSubview(label)
        
        let comeToRecife = UIButton()
        comeToRecife.frame = CGRect(x: 260, y: 300, width: 230, height: 40)
        comeToRecife.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.2509803922, blue: 0.2078431373, alpha: 1)
        comeToRecife.layer.cornerRadius = 12
        comeToRecife.setTitle("Come To Recife!", for: UIControlState.normal)
        comeToRecife.titleLabel?.font =  UIFont(name: "ActionMan", size: 25)
        comeToRecife.addTarget(self, action: #selector(buttonPress), for: UIControlEvents.touchUpInside)
        view.addSubview(comeToRecife)
        
        self.view = view
    }
    
    @objc func buttonPress() {
        let game = MyViewControllerRecife()
        present(MyViewControllerRecife(), animated: false, completion: nil)
    }
}


