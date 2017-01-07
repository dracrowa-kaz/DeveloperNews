//
//  ViewController.swift
//  DeveloperNews
//
//  Created by 佐藤和希 on 1/4/17.
//  Copyright © 2017 kaz. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MainViewController: ButtonBarPagerTabStripViewController {
    
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return createViewControllers(feeds: feeds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingBarView()
    }
    
   func createViewControllers(feeds:[Dictionary<String, String>])->[UIViewController]{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let parseVc = ParseJsonController()
        let contents = parseVc.parseJson(feeds: feeds)
    
        let childsVcArray = feeds.enumerated().map{index,element -> ChildViewController in
            let childVc = storyboard.instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
            childVc.setInitNewsContent(number: index, newsContent: contents[index])
            return childVc
        }
        return childsVcArray
    }
    
    func settingBarView(){
        self.settings.style.selectedBarHeight = 2
        self.settings.style.selectedBarBackgroundColor = UIColor.black
        self.settings.style.buttonBarItemBackgroundColor = UIColor.darkGray
        self.settings.style.buttonBarBackgroundColor = UIColor.darkGray
        self.buttonBarView.backgroundColor = UIColor.darkGray
        self.view.backgroundColor = UIColor.darkGray
        self.buttonBarView.frame = CGRect(x: 0, y: 15, width: self.buttonBarView.frame.width, height: self.buttonBarView.frame.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
