//
//  MainButtonBarPagerViewController.swift
//  DeveloperNews
//
//  Created by 佐藤和希 on 1/15/17.
//  Copyright © 2017 kaz. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import KRProgressHUD

class MainButtonBarPagerViewController: ButtonBarPagerTabStripViewController {
    
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return createViewControllers(feeds: feeds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingBarView()
    }
    
    //MARK: - XLPagerTabStrip delegate
    func createViewControllers(feeds:[Dictionary<String, String>])->[UIViewController]{
        KRProgressHUD.show()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let apiVc = APIController()
        let json = apiVc.getJSON(url: "http://rss")
        let parseVc = ParseJsonController()
        let contents = parseVc.parseJson(json: json!)
        
        let childsVcArray = feeds.enumerated().map{index,element -> ChildViewController in
            let childVc = storyboard.instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
            childVc.setInitNewsContent(number: index, newsContent: contents)
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
