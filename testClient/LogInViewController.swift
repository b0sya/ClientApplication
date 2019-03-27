//
//  ViewController.swift
//  testClient
//
//  Created by b0ysa on 23/03/2019.
//  Copyright © 2019 b0ysa. All rights reserved.
//

import UIKit


class LogInViewController: UIViewController, UITextFieldDelegate{
    
    //MARK: - Properties
    let login = "1"
    let password = "2"
    
    //MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var signInButton: SignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupUiElems()
        
    }
    
    func setupUiElems(){
        loginField.delegate = self //to go to the next field with the next keyboard button
        passwordField.delegate = self // like loginField
        loginField.returnKeyType = UIReturnKeyType.next
        passwordField.returnKeyType = UIReturnKeyType.go
        signInButton.backgroundColor = UIColor(red:0.00, green:0.87, blue:0.88, alpha:0.3)
        loginField.addTarget(self, action: #selector(checkActivSign), for: .allEvents)
        passwordField.addTarget(self, action: #selector(checkActivSign), for: .allEvents)
        signInButton.addTarget(self, action: #selector(isAuthorized), for: .touchUpInside)
        registerForKeyboardNotifications()
    }
    
    //MARK: - Actions
    @IBAction func loginFieldAction(_ sender: Any) {
    }
    
    @IBAction func passwordFieldAction(_ sender: Any) {
    }
    
    //MARK: - a methods that fixes overlap textField with keyboard
    func removeKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func kbWillShow (_ notification: Notification) {
        let userInfo = notification.userInfo
        let kBFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kBFrameSize.height - 80)
    }
    
    @objc func kbWillHide (_ notification: Notification) {
        scrollView.contentOffset = CGPoint.zero
    }
    
    //MARK:  methods to hide the keyboard
    @IBAction func tap(_ sender: Any) {
        loginField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    //MARK: - Methods
    @objc func isAuthorized()->Bool{
        if ((self.loginField.text == self.login) && (self.passwordField.text == self.password)){
            self.performSegue(withIdentifier: "to_news", sender: self)
            return true
        }else{
            showAlert(title:"Ошибка", message: "Вы ввели неверный логин/пароль", style: .actionSheet)
            return false
        }
    }
    
    @objc func checkActivSign(){
        if !((loginField.hasText)&&(passwordField.hasText)){
            signInButton.isEnabled = false
            signInButton.backgroundColor = UIColor(red:0.00, green:0.87, blue:0.88, alpha:0.3)
        }else{
            signInButton.isEnabled = true
            signInButton.backgroundColor = UIColor(red:0.00, green:0.87, blue:0.88, alpha:1.0)
        }
    }
    
    func showAlert(title: String?, message: String, style: UIAlertController.Style){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionOK = UIAlertAction(title: "Ok", style: .default) { (actionOk) in
            
        }
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - go next textView why next touched
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
}


