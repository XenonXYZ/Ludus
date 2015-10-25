//
//  CSkillsViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/25/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit
import Parse

class CSkillsViewController: UIViewController {

    // Properties
    var currentStudent: PFObject!
    var skillArray: [PFObject] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let query = PFQuery(className:"Skill")
        query.whereKey("student", equalTo: currentStudent!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects as [PFObject]! {
                    for object in objects {
                        self.skillArray.append(object)
                    }
                }
                self.tableView.reloadData()
                print(self.skillArray)
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
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

    @IBAction func backButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

    @IBAction func addSkillButtonPressed(sender: UIButton) {
        
    }
}
