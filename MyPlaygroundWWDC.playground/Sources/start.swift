import Foundation
import UIKit

public class VC : UIViewController {
  
  public override func loadView(){
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9568627451, blue: 0.5960784314, alpha: 1)
    self.view = view
  }
  
  @objc func buttonPress() {
    let vc = MyViewController()
    print("testes")
    present(MyViewController(), animated: false, completion: nil)
  }
}


