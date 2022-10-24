//
//  ThirdViewController.swift
//  findKeyApp
//
//  Created by ibaikaa on 8/10/22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var goToFirstVCButton: UIButton!
    
    @IBOutlet weak var goToFourthVCButton: UIButton!
    
    
    @IBOutlet weak var tryAgainButton: UIButton!
    
    @IBOutlet weak var gameStateLabel: UILabel!
    
    @IBAction func goToFirstViewController(_ sender: UIButton) {
        let firstViewController = storyboard?.instantiateViewController(withIdentifier: "first_vc") as! FirstViewController
        self.navigationController?.pushViewController(firstViewController, animated: false)
        stepsLeft -= 1
    }
    
    
    @IBAction func goToFourthViewController(_ sender: UIButton) {
        let fourthViewController = storyboard?.instantiateViewController(withIdentifier: "fourth_vc") as! FourthViewController
        self.navigationController?.pushViewController(fourthViewController, animated: false)
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
            goToFirstVCButton.isEnabled = false
            goToFourthVCButton.isEnabled = false
            tryAgainButton.isHidden = false
        } else {
            gameStateLabel.text = "Steps left: \(stepsLeft)"
            goToFirstVCButton.isEnabled = true
            goToFourthVCButton.isEnabled = true
            tryAgainButton.isHidden = true
        }
    }
}
