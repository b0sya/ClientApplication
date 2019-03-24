//
//  ViewController.swift
//  testClient
//
//  Created by b0ysa on 23/03/2019.
//  Copyright © 2019 b0ysa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Properties
    
    let login = "Bosya"
    let password = "12345"
    var authorCheckLogin = false
    var authorCheckPassword = false
    
    //MARK: - Outlets
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInlabel: UITextView!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.placeholder = "Login"
        passwordField.placeholder = "Password"
        loginField.delegate = self
        passwordField.delegate = self
        signInButton.layer.cornerRadius = 16
        signInButton.layer.shadowColor = UIColor.black.cgColor
        signInButton.layer.shadowOpacity = 0.4
        signInButton.layer.shadowRadius = 6
        signInButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        signInButton.layer.shouldRasterize = true
        signInButton.addTarget(self, action: #selector(authorizationCheck), for: .touchUpInside)
    
        
    }
    
    //MARK: - Actions
    @IBAction func loginFieldAction(_ sender: Any) {
        if (self.loginField.text == self.login){
            authorCheckLogin = true
        }
    }
    
    //MARK: - Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    func textFieldShouldReturn (textField: UITextField)->Bool {
        textField.resignFirstResponder();
        return true
    }
    
    @objc func authorizationCheck(){
        if ((self.loginField.text == self.login) && (self.passwordField.text == self.password)){
            showAlert(title:nil, message: "Вы успешно вошли в аккаунт!", style: .actionSheet)
        }else{
            showAlert(title:"Ошибка", message: "Вы ввели неверный логин/пароль", style: .actionSheet)
        }
    }
    
    func showAlert(title: String?, message: String, style: UIAlertController.Style){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionOK = UIAlertAction(title: "Ok", style: .default) { (actionOk) in
            
        }
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func passwordFieldAction(_ sender: Any) {
        authorCheckPassword = true
    }
    
}

