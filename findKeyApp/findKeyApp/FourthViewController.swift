//
//  FourthViewController.swift
//  findKeyApp
//
//  Created by ibaikaa on 8/10/22.
//

import UIKit

class FourthViewController: UIViewController {
    
    
    
    @IBOutlet weak var goToSecondVCButton: UIButton!
    
    @IBOutlet weak var goToThirdVCButton: UIButton!
    
    @IBOutlet weak var gameStateLabel: UILabel!
    
    
    
    @IBAction func goToSecondViewController(_ sender: UIButton) {
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "second_vc") as! SecondViewController
        self.navigationController?.pushViewController(secondViewController, animated: false)
        }
    
    
    
    @IBAction func goToThirdViewController(_ sender: UIButton) {
        let thirdViewController = storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
        self.navigationController?.pushViewController(thirdViewController, animated: false)
    }
    
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        gameStateLabel.text = "You won!"
        goToSecondVCButton.isEnabled = false
        goToThirdVCButton.isEnabled = false
    }
}
