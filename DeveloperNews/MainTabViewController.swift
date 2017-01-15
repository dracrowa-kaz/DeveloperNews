//
//  MainTabViewController.swift
//  DeveloperNews
//
//  Created by 佐藤和希 on 1/15/17.
//  Copyright © 2017 kaz. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import KRProgressHUD

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let firstView = storyboard.instantiateViewController(withIdentifier: "MainButtonBarPagerViewController") as! MainButtonBarPagerViewController
        let secondView = UIViewController()
        
        firstView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.featured, tag: 1)
        secondView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 2)
        
        let myTabs = NSArray(objects: firstView, secondView)
        self.setViewControllers(myTabs as! [UIViewController], animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
