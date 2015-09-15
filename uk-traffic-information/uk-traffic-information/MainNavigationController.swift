//
//  MainNavigationController.swift
//  uk-traffic-information
//
//  Created by Alex Chesters on 15/09/2015.
//  Copyright © 2015 Alex Chesters. All rights reserved.
//

import UIKit

class MainNavigationController: ENSideMenuNavigationController, ENSideMenuDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: MenuTableViewController(), menuPosition:.Left)
        sideMenu?.menuWidth = 180.0 // optional, default is 160
        sideMenu?.bouncingEnabled = false
        
        // make navigation bar showing over side menu
        view.bringSubviewToFront(navigationBar)
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}
