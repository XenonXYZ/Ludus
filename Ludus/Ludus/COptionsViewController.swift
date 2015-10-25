//
//  COptionsViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/25/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit
import Parse

class COptionsViewController: UIViewController {

    var currentStudent: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func backButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "teacherSkillsSegue") {
            let skillVC: CSkillsViewController = segue.destinationViewController as! CSkillsViewController
            skillVC.currentStudent = currentStudent
        } else if (segue.identifier == "teacherFeedbackSegue") {
            let feedVC: CFeedbackViewController = segue.destinationViewController as! CFeedbackViewController
            feedVC.currentStudent = currentStudent
        }
    }
}
