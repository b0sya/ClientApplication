//
//  ViewController.swift
//  testClient
//
//  Created by b0ysa on 23/03/2019.
//  Copyright © 2019 b0ysa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    let login = "Bosya"
    let password = "12345"
    var authorCheckLogin = false
    var authorCheckPassword = false
    
    //MARK: - Outlets
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInlabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.placeholder = "Login"
        passwordField.placeholder = "Password"
        passwordField.isUserInteractionEnabled = true
        
        
    }
    
    //MARK: - Actions
    @IBAction func loginFieldAction(_ sender: Any) {
        if (self.loginField.text == self.login){
            authorCheckLogin = true
        }
    }
    
    @IBAction func passwordFieldAction(_ sender: Any) {
        authorCheckPassword = true
    }
}

    //MARK: - Methods
func authorizationCheck(loginChecker: Bool, passwordChecker: Bool) -> String{
    if (loginChecker && passwordChecker) {
        return "Вы успешно вошли в аккаунт"
    }else{
        return "Вы ввели не правильный логин/пароль"
    }
}
