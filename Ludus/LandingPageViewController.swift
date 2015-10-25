//
//  LandingPageViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/25/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {
    
    // Properties
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonPressed(sender: UIButton) {
        
    }
    
    @IBAction func signupButtonPressed(sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
