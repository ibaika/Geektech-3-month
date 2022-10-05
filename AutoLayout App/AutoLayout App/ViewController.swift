//
//  ViewController.swift
//  AutoLayout App
//
//  Created by ibaikaa on 3/10/22.
//


//Сверстать окно регистрации по скелету на картинке использую сonstraints. Верстка должна быть одинаковой для всех устройств. Cоздать словарь из username и password, добавить данные некоторых пользователей. По нажатию sign up добавить новые данные в словарь и распечатать в консоли. По нажатию sign in, cделать поиск по словарю, если есть совпадение, то вывести: “вы успешно вошли”, если нет “вы должны зарегистрироваться”


import UIKit

class ViewController: UIViewController {
    
    var userPasswordData:[String:String] = ["Ian":"cat", "superuser":"superpassword"]
    

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var inputedUsername: String = String()
    var inputedPassword: String = String()

    
    func resetResultLabelAndStringVariables(){
        inputedUsername.removeAll()
        inputedPassword.removeAll()
        resultLabel.text?.removeAll()
    }
    
    func setupBeforeMakingAction(){
        resetResultLabelAndStringVariables()
        resultLabel.isHidden = false
    }
    
    
    func userIsNotRegisteredYet(username: String) -> Bool{
       return userPasswordData[username] == nil
    }
    
    func signUp(){
        if isGivenData(){
            
            inputedUsername = usernameTextField.text!
            inputedPassword = passwordTextField.text!
            
            if userIsNotRegisteredYet(username: inputedUsername){
                addUser(inputedUsername, inputedPassword)
                resultLabel.text = "Вы добавлены! ✅"
                print("Вы добавлены! ✅")
            } else {
                resultLabel.text = "Вы уже зарегистрированы!"
                print("Вы уже зарегистрированы!")
            }
            
        } else {
            resultLabel.text = "Введите данные! 😠"
            print("Введите данные! 😠")

        }
        

        
        func addUser(_ username: String, _ password: String){
            userPasswordData[username] = password
        }
        
     
    }

    func isGivenData() -> Bool{
        var result: Bool = false
        if let username = usernameTextField.text, let password = passwordTextField.text{
            if username != "" && password != ""{
                result = true
            }
        }
        return result
    }
    
    
    
    
    func signIn(){
        
        if isGivenData(){
            
            inputedUsername = usernameTextField.text!
            inputedPassword = passwordTextField.text!
            
            if userIsNotRegisteredYet(username: inputedUsername){
                print(inputedUsername)
                print(userPasswordData)
                resultLabel.text = "Вы не зарегистрированы!"
                print("Вы не зарегитсрированы!")
            } else if !userIsNotRegisteredYet(username: inputedUsername){
                if passwordCorrectlyGiven(inputedUsername, inputedPassword){
                    resultLabel.text = "Успешный вход! ✅"
                    print("Успешный вход! ✅")
                } else {
                    resultLabel.text = "Неправильный логин/пароль! "
                    print("Неправильный логин/пароль! ")
                }
            }
            
            
            func passwordCorrectlyGiven(_ username: String, _ password:String) -> Bool{
               password == userPasswordData[username]
            }
            
        } else {
            resultLabel.text = "Введите данные! 😠"
            print("Введите данные! 😠")
        }
        
        
    }

    
    
    
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        setupBeforeMakingAction()
        signIn()
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        setupBeforeMakingAction()
        signUp()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.isHidden = true
        
        // Do any additional setup after loading the view.
    }


}

