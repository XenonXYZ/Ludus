//
//  SHomepageViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/24/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit
import Parse

class SHomepageViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        if (PFUser.currentUser() == nil) {
            self.view.hidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (PFUser.currentUser() == nil) {
            dispatch_async(dispatch_get_main_queue()) {
                self.performSegueWithIdentifier("loginSegue", sender: self)
            }
        }
        
        
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
    
    @IBAction func logoutButtonPressed(sender: UIButton) {
        PFUser.logOutInBackgroundWithBlock { (error) -> Void in
            if (error != nil) {
                ProgressHUD.showError("Logout unsuccessful")
            } else {
                self.performSegueWithIdentifier("loginSegue", sender: self)
            }
        }
    }
}
