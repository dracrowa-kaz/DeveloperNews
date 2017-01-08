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
import SafariServices

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
            let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedView(_:)))
            view.addGestureRecognizer(gesture)
            startY += viewHeight
            self.scrollView.addSubview(view)
            scrollView.contentSize =  CGSize(width: scrollView.frame.width, height: view.frame.maxY)
        }
    }
    
    func tappedView(_ sender:UITapGestureRecognizer){
        let view = sender.view as! CustomContentView
        let Url = NSURL(string: view.link)
        let safariViewController = SFSafariViewController(url: Url as! URL)
        present(safariViewController, animated: false, completion: nil)
    }
    
    //MARK: - XLPagerTabStrip delegate
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: feeds[self.number!]["title"]!)
    }
}

class CustomContentView : UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    var link: String = ""
    
    func setContent(newsContent:newsContetntsStruct){
        self.link = newsContent.link
        
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
