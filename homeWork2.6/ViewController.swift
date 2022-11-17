//
//  ViewController.swift
//  homeWork2.6
//
//  Created by Алексей Исаев on 16.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userVC = segue.destination as? UserViewController {
            userVC.user = usernameTF.text
        }
        guard usernameTF.text == "User", passwordTF.text == "Password" else {
            showAlert(with: "Please, try again", and: "Incorrect username or password")
            return
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        if let _ = segue.source as? UserViewController {
            usernameTF.text = ""
            passwordTF.text = ""
        }
    }
    
    @IBAction func remindUsername() {
        showAlert(with: "Username", and: "Your name is User")
    }
    
    @IBAction func remindPassword() {
        showAlert(with: "Password", and: "Your password is Password")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ViewController {
    private func showAlert(with title: String, and massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.usernameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
