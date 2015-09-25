//
//  MainTableViewController.swift
//  uk-traffic-information
//
//  Created by Alex Chesters on 15/09/2015.
//  Copyright © 2015 Alex Chesters. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, ENSideMenuDelegate {
    
    // The data used to populate the table
    var tableData = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "All Incidents"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: UIBarButtonItemStyle.Plain, target: self, action: "toggleSideMenu")
        self.sideMenuController()?.sideMenu?.delegate = self
        self.tableView.rowHeight = 100
        RSSFeedParser( { (data) in
            if data.count != 0 {
                self.tableData = data
                self.tableView.reloadData()
            }
        })
    }
    
    func toggleSideMenu() {
        toggleSideMenuView()
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuShouldOpenSideMenu() -> Bool {
        return true
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UKTITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entry", forIndexPath: indexPath) as! UKTITableViewCell
        cell.topLeftLabel?.text = tableData[indexPath.row].description
        cell.topLeftLabel?.numberOfLines = 0
        cell.bottomLeftLabel?.text = tableData[indexPath.row].category
        cell.bottomRightLabel?.text = "\(tableData[indexPath.row].region) - \(tableData[indexPath.row].road)"
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(tableData[indexPath.row].latitude)
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
