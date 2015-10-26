//
//  SignupViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/25/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController, UITextFieldDelegate {

    // Properties
    
    @IBOutlet weak var personOption: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailTextField.delegate = self
        self.usernameTextField.delegate = self
        self.passwordConfirmTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordConfirmTextField.delegate = self
        
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


    @IBAction func signupButtonPressed(sender: UIButton) {
        
        // Close the keyboard
        self.view.endEditing(true)
        
        // Log the user in and check for errors
        if (passwordTextField.text == passwordConfirmTextField.text) {

            let email = emailTextField.text
            let username = usernameTextField.text
            let password = passwordTextField.text
            
            if (username!.utf16.count < 1 || password!.utf16.count < 1) {
                ProgressHUD.showError("Please enter a username and password")
            } else if (email!.utf16.count < 8) {
                ProgressHUD.showError("Please enter a valid email")
            } else {
                
                let newUser = PFUser()
                newUser.email = email
                newUser.username = username
                newUser.password = password

                if (personOption.selectedSegmentIndex == 0) {
                    newUser["name"] = ""
                    newUser["sport"] = ""
                    newUser["coach"] = ""
                    newUser["city"] = ""
                    newUser["feedback"] = ""
                    newUser["occupation"] = 0
                } else {
                    newUser["name"] = ""
                    newUser["feedback"] = ""
                    newUser["occupation"] = 1
                }
                
                
                newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                    if let sError = error {
                        if sError.code == 125 {
                            ProgressHUD.showError("Invalid email")
                        } else if sError.code == 203 {
                            ProgressHUD.showError("Email already in use")
                        } else if sError.code == 202 {
                            ProgressHUD.showError("Username taken")
                        } else {
                            ProgressHUD.showError("Unkown error occured")
                        }
                    } else {
                        ProgressHUD.showSuccess("Success!")
                        
                        if (self.personOption.selectedSegmentIndex == 0) {
                            self.performSegueWithIdentifier("sSignupComplete", sender: nil)
                        } else {
                            self.performSegueWithIdentifier("cSignupComplete", sender: nil)
                        }
                    }
                })
            }
            
        } else {
            ProgressHUD.showError("Passwords do not match")
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





































