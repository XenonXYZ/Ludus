//
//  SFeedbackViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/25/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit
import Parse

class SFeedbackViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var feedbackTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedbackTextView.delegate = self
        
        let feedback = PFUser.currentUser()!["feedback"] as! String
        feedbackTextView.text = feedback
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
}
