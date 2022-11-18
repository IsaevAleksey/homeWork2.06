//
//  ViewController.swift
//  homeWork2.6
//
//  Created by Алексей Исаев on 16.11.2022.
//

import UIKit

final class StartViewController: UIViewController {
    
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private var login = "User"
    private var password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userVC = segue.destination as? UserViewController {
            userVC.user = usernameTF.text
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func loginActionButton() {
        guard usernameTF.text == login, passwordTF.text == password else {
            showAlert(with: "Please, try again", and: "Incorrect username or password")
            return
        }
    }
    
    @IBAction func remindUsername() {
        showAlert(with: "Username", and: "Your name is User")
    }
    
    @IBAction func remindPassword() {
        showAlert(with: "Password", and: "Your password is Password")
    }
    

}

extension StartViewController {
    private func showAlert(with title: String, and massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
