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
    
    // The selected event, this is used to pass information to the DetailViewController
    var selectedEvent: Event!

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
        cell.topLeftLabel?.text = tableData[indexPath.row].getDescription()
        cell.topLeftLabel?.numberOfLines = 0
        cell.bottomLeftLabel?.text = tableData[indexPath.row].getCategory()
        cell.bottomRightLabel?.text = "\(tableData[indexPath.row].getRegion()) - \(tableData[indexPath.row].getRoad())"
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedEvent = tableData[indexPath.row]
        self.performSegueWithIdentifier("openDetail", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "openDetail" {
            let svc = segue.destinationViewController as! DetailViewController
            svc.selectedEvent = selectedEvent
        }
    }

}
