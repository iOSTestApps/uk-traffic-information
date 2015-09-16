//
//  MenuTableViewController.swift
//  uk-traffic-information
//
//  Created by Alex Chesters on 15/09/2015.
//  Copyright © 2015 Alex Chesters. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    // An array of menu items
    var menuItems = [MenuItem]()
    
    var selectedMenuIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        menuItems = [
            MenuItem(title: "All Incidents", viewController: mainStoryboard.instantiateViewControllerWithIdentifier("MainTableViewController")),
            MenuItem(title: "Settings", viewController: mainStoryboard.instantiateViewControllerWithIdentifier("MainTableViewController"))
        ]
        
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.backgroundColor = UIColor.clearColor()
        tableView.scrollsToTop = false
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        tableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuIndex, inSection: 0), animated: false, scrollPosition: .Middle)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return menuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as UITableViewCell!
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel?.textColor = UIColor.darkGrayColor()
            let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            selectedBackgroundView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            cell!.selectedBackgroundView = selectedBackgroundView
        }
        
        cell!.textLabel?.text = menuItems[indexPath.row].title
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (indexPath.row == selectedMenuIndex) { return }
        
        selectedMenuIndex = indexPath.row
        
        sideMenuController()?.setContentViewController(menuItems[indexPath.row].viewController)
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}