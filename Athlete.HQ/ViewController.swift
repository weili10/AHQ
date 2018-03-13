//
//  ViewController.swift
//  Athlete.HQ
//
//  Created by Wei Li on 12/3/18.
//  Copyright © 2018 Wei Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    //MARK: Properties
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameField.delegate = self
        passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    
    //MARK: Actions
    @IBAction func tapSignInButton(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainTabBarController = segue.destination as? MainTabBarController {
            mainTabBarController.username = usernameField.text
            mainTabBarController.password = passwordField.text
        }
    }

}

