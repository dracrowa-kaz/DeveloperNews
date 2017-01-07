//
//  ChildViewController.swift
//  DeveloperNews
//
//  Created by 佐藤和希 on 1/7/17.
//  Copyright © 2017 kaz. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import KRProgressHUD

class ChildViewController : UIViewController , IndicatorInfoProvider {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var number : Int?
    private var contentStruct : [newsContetntsStruct]?
    
    func setInitNewsContent(number:Int , newsContent:[newsContetntsStruct]){
        self.number = number
        self.contentStruct = newsContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        createContentView(newsContents: contentStruct!)
        KRProgressHUD.dismiss()
    }
    
   func createContentView(newsContents:[newsContetntsStruct]){
        let viewHeight = 175
        var startY = 15
        newsContents.forEach{ element in
            let view : CustomContentView =  UINib(nibName: "CustomContentView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! CustomContentView
            let rect : CGRect = CGRect(x: 0, y: startY , width: Int(scrollView.frame.width) , height: Int(view.frame.height))
            view.frame  = rect
            view.setContent(newsContent: element)
            startY += viewHeight
            self.scrollView.addSubview(view)
            scrollView.contentSize =  CGSize(width: scrollView.frame.width, height: view.frame.maxY)
        }
    }
    
    //MARK: - XLPagerTabStrip delegate
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: feeds[self.number!]["title"]!)
    }
}

class CustomContentView : UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func setContent(newsContent:newsContetntsStruct){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.titleLabel.text = newsContent.title
        self.titleLabel.sizeToFit()
        self.contentLabel.text = newsContent.contentSnippet
        self.contentLabel.sizeToFit()
        self.contentLabel.layer.borderWidth = 1
        self.contentLabel.layer.borderColor = UIColor.black.cgColor
    }
}
