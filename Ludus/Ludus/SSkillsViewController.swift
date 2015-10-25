//
//  SSkillsViewController.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/24/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit
import Parse

class SSkillsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Properties
    var skillArray: [PFObject] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let query = PFQuery(className:"Skill")
        query.whereKey("student", equalTo: PFUser.currentUser()!)
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
    
    // MARK: TableView Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skillArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: SkillCell = tableView.dequeueReusableCellWithIdentifier("skillCell") as! SkillCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        cell.skillLabel.text = skillArray[indexPath.row]["name"] as? String
        
        let oldFrame = cell.barView.frame
        let newFrame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, tableView.frame.width - 60, oldFrame.height)
        let newBar = UIView(frame: newFrame)
        newBar.backgroundColor = cell.barView.backgroundColor
        
        var scaleFactor = skillArray[indexPath.row]["scale"] as! CGFloat
        scaleFactor /= 100
        
        newBar.frame.size.width = newBar.frame.width * scaleFactor
        cell.barView.removeFromSuperview()
        
        cell.contentView.addSubview(newBar)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: Other stuff
    
    @IBAction func backButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

}
























