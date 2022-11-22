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
    
    private let user = User.getUser()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func loginActionButton() {
        guard usernameTF.text == user.login, passwordTF.text == user.password else {
            showAlert(with: "Please, try again", and: "Incorrect username or password", textField: passwordTF)
            return
        }
        performSegue(withIdentifier: "showUserVC", sender: nil)
    }
    
    
    @IBAction func remindUserData(_ sender: UIButton ) {
        sender.tag == 0
        ? showAlert(with: "Username", and: "Your name is \(user.login)")
        : showAlert(with: "Password", and: "Your password is \(user.password)")
    }
}

extension StartViewController {
    private func showAlert(with title: String, and message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
