//
//  LoginViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/25/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        
        // Close the keyboard
        self.view.endEditing(true)
        
        // Log the user in and check for errors
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        if (username.utf16.count < 1 || password.utf16.count < 1) {
            ProgressHUD.showError("Please enter your username and password")
        } else {
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
                if let sError = error {
                    if sError.code == 101 {
                        ProgressHUD.showError("Invalid username or password")
                    } else {
                        ProgressHUD.showError("Unkown error occured")
                    }
                } else {
                    if let user = PFUser.currentUser() {
                        ProgressHUD.showSuccess("Logged in!")
                        if (user["occupation"] as! Int == 0) {
                            self.performSegueWithIdentifier("sLoginComplete", sender: nil)
                        } else {
                            self.performSegueWithIdentifier("cLoginComplete", sender: nil)
                        }
                    }
                }
            })
        }
    }
    
    
    // MARK: UITextFieldDelegate
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func backButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
}



















