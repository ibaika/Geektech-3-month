import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func startButton(_ sender: UIButton) {
        let randomNumber = Int.random(in: 1...4)
        print(randomNumber)
        stepsLeft = 3

        
        switch randomNumber {
        case 1:
            let targetViewController = storyboard!.instantiateViewController(withIdentifier: "first_vc") as! FirstViewController
            
            navigationController?.pushViewController(targetViewController, animated: false)
        case 2:
            let targetViewController = storyboard!.instantiateViewController(withIdentifier: "second_vc") as! SecondViewController
            
            navigationController?.pushViewController(targetViewController, animated: false)
        case 3:
            let targetViewController = storyboard!.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
            
            navigationController?.pushViewController(targetViewController, animated: false)
        case 4:
            let targetViewController = storyboard!.instantiateViewController(withIdentifier: "fourth_vc") as! FourthViewController
            
            navigationController?.pushViewController(targetViewController, animated: false)
        default:
            break
        
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    


}

