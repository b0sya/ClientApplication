//
//  RegistrationViewController.swift
//  testClient
//
//  Created by b0sya on 26.03.2019.
//  Copyright © 2019 b0ysa. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passConfirmField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if passwordField.text != passConfirmField.text {
            showAlert(title: "Password Incorrect", message: "Please re-type password", style: .alert)
            
        }
        else{
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!){ (user, error) in
                if error == nil {
                    //self.showAlert(title: nil, message: "Sign up soccessfull!", style: .actionSheet)
                    self.performSegue(withIdentifier: "signUptoHome", sender: self)
                }
                else{
                    self.showAlert(title: "Error", message: error?.localizedDescription, style: .alert)
                }
            }
        }
    }
    
    func showAlert(title: String?, message: String?, style: UIAlertController.Style){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionOK = UIAlertAction(title: "Ok", style: .default) { (actionOk) in
            
        }
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tap(_ sender: Any) {
        nameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        passConfirmField.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
