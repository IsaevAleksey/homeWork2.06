//
//  UserViewController.swift
//  homeWork2.6
//
//  Created by Алексей Исаев on 16.11.2022.
//

import UIKit

class UserViewController: UIViewController {

    var user: String!
    
    @IBOutlet var helloUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloUserLabel.text = "Hello, " + user
    }

    @IBAction func logoutAction() {
        dismiss(animated: true)
    }    
}
