//
//  CFeedbackViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/25/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit
import Parse

class CFeedbackViewController: UIViewController, UITextViewDelegate {

    // Properties
    var currentStudent: PFObject!
    @IBOutlet weak var feedbackView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedbackView.delegate = self
        
        let feedback = currentStudent["feedback"] as! String
        feedbackView.text = feedback
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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    @IBAction func saveButtonPressed(sender: UIButton) {
        currentStudent["feedback"] = feedbackView.text
        currentStudent.saveInBackground()
    }
    
    @IBAction func backButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
}
