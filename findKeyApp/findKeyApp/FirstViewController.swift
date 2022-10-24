//
//  FirstViewController.swift
//  findKeyApp
//
//  Created by ibaikaa on 8/10/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    
    @IBOutlet weak var goToSecondVCButton: UIButton!
    
    @IBOutlet weak var goToThirdVCButton: UIButton!
    
    @IBOutlet weak var tryAgainButton: UIButton!
    
    
    @IBOutlet weak var gameStateLabel: UILabel!
    
    
    @IBAction func goToSecondViewContoller(_ sender: UIButton) {
        let secondViewContoller = storyboard?.instantiateViewController(withIdentifier: "second_vc") as! SecondViewController
        self.navigationController?.pushViewController(secondViewContoller, animated: false)
        stepsLeft -= 1

    }
    
    
    @IBAction func goToThirdViewController(_ sender: UIButton) {
        let thirdViewController = storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
        self.navigationController?.pushViewController(thirdViewController, animated: false)
        stepsLeft -= 1

    }
    
    
    @IBAction func tryAgainButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
    
        
        if !canContinuePlaying(stepsLeft: stepsLeft){
            gameStateLabel.text = "You lost!"
            goToThirdVCButton.isEnabled = false
            goToSecondVCButton.isEnabled = false
            tryAgainButton.isHidden = false

        } else {
            gameStateLabel.text = "Steps left: \(stepsLeft)"
            goToThirdVCButton.isEnabled = true
            goToSecondVCButton.isEnabled = true
            tryAgainButton.isHidden = true


        }
        
        

    }
}
