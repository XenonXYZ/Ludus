//
//  SProfileViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/24/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit
import Parse

class SProfileViewController: UIViewController, UITextFieldDelegate {

    // Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sportTextField: UITextField!
    @IBOutlet weak var coachTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.delegate = self
        self.sportTextField.delegate = self
        self.coachTextField.delegate = self
        self.cityTextField.delegate = self
        
        self.nameTextField.text = PFUser.currentUser()!["name"] as? String
        self.sportTextField.text = PFUser.currentUser()!["sport"] as? String
        self.coachTextField.text = PFUser.currentUser()!["coach"] as? String
        self.cityTextField.text = PFUser.currentUser()!["city"] as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Text field delegate
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    
    @IBAction func saveButtonPressed(sender: UIButton) {
        let user = PFUser.currentUser()!
        user["name"] = nameTextField.text
        user["sport"] = sportTextField.text
        user["coach"] = coachTextField.text
        user["city"] = cityTextField.text
        
        user.saveInBackground()
        
    }

}
