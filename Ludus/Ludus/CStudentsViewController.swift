//
//  CHomepageViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/25/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit
import Parse

class CStudentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Properties
    var studentArray: [PFObject] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className:"User")
        query.whereKey("teacher", equalTo: PFUser.currentUser()!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects as [PFObject]! {
                    for object in objects {
                        self.studentArray.append(object as! PFUser)
                        print(object)
                    }
                }
                self.tableView.reloadData()
                print(self.studentArray)
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
                self.tableView.reloadData()
            }
            self.tableView.reloadData()
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
    
    
    // MARK: TableView Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: StudentCell = tableView.dequeueReusableCellWithIdentifier("studentCell") as! StudentCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.nameLabel.text = studentArray[indexPath.row]["name"] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("studentSelection", sender: nil)
    }
    
    // MARK: Other stuff
    
    @IBAction func backButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "studentSelection") {
            let optionVC: COptionsViewController = segue.destinationViewController as! COptionsViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let studentUser = studentArray[indexPath.row]
            optionVC.currentStudent = studentUser
        }
    }

    @IBAction func logoutButtonPressed(sender: AnyObject) {
        PFUser.logOutInBackgroundWithBlock { (error) -> Void in
            if (error != nil) {
                ProgressHUD.showError("Logout unsuccessful")
            } else {
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            }
        }
    }
}
