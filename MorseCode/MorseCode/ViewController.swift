import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let morseDictionary: [String: String] = [ "A":".-", "B":"-...",
                                              "C":"-.-.", "D":"-..", "E":".",
                                              "F":"..-.", "G":"--.", "H":"....",
                                              "I":"..", "J":".---", "K":"-.-",
                                              "L":".-..", "M":"--", "N":"-.",
                                              "O":"---", "P":".--.", "Q":"--.-",
                                              "R":".-.", "S":"...", "T":"-",
                                              "U":"..-", "V":"...-", "W":".--",
                                              "X":"-..-", "Y":"-.--", "Z":"--..",
                                              "1":".----", "2":"..---", "3":"...--",
                                              "4":"....-", "5":".....", "6":"-....",
                                              "7":"--...", "8":"---..", "9":"----.",
                                              "0":"-----", ",": "--..--", ".":".-.-.-",
                                              "?":"..--..", "/":"-..-.", "-":"-....-",
                                              ]
    
    var decodedText: String = String()

    var textToDecode: String? = nil
    
    @IBAction func decodeButtonTapped(_ sender: UIButton) {

        resultLabel.text?.removeAll()
        decodedText.removeAll()
        
        textToDecode = inputTextField.text
        
        if let textToDecode = textToDecode {
            for c in textToDecode{
                for i in morseDictionary{
                    if String(c) == i.key || String(c).uppercased() == i.key{
                        decodedText.append(i.value)
                        decodedText.append(" ")
                    }
                }
            } 
        }
        resultLabel.text = decodedText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

