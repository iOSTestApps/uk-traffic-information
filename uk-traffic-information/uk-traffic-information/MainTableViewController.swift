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
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: UIBarButtonItemStyle.Plain, target: self, action: "toggleSideMenu")
        self.sideMenuController()?.sideMenu?.delegate = self
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
    func sideMenuWillOpen() {
        
    }
    
    func sideMenuWillClose() {
        
    }
    
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

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entry", forIndexPath: indexPath)
        cell.textLabel?.text = tableData[indexPath.row].description
        return cell
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
