//
//  ParseJsonController.swift
//  DeveloperNews
//
//  Created by 佐藤和希 on 1/5/17.
//  Copyright © 2017 kaz. All rights reserved.
//

import Foundation
import SwiftyJSON
import AlamofireXmlToObjects

struct newsContetntsStruct{
    var title : String
    var publishedDate : String
    var link : String
    var contentSnippet : String
}

class ParseJsonController {
    func parseJson(json:JSON)->[newsContetntsStruct]{
        var newsContentsArray = [newsContetntsStruct]()
        var newsContent : newsContetntsStruct?
        
        for jsonElement in json.array!{
            newsContent = newsContetntsStruct(
                title: jsonElement["title"].stringValue,
                publishedDate: jsonElement["publishedDate"].stringValue,
                link: jsonElement["link"].stringValue,
                contentSnippet:jsonElement["content"].stringValue
            )
            newsContentsArray.append(newsContent!)
        }
        
        return newsContentsArray
    }
}

var feedJson : [Dictionary<String, String>] =
    [
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/top/rss",
            "title": "The Most Popular Programming Languages Based On Jobs, Search Engines, and More",
            "content": "There’s no rule that says you have to learn the most popular programming languages, but if you want to code for a living it might be beneficial to know what’s in demand and trending.",
            "publishedDate": "2016/07/11"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/top/rss",
            "title": "Microsoft's Visual Studio Launches on Mac",
            "content": "Alongside the announcement of the upcoming Visual Studio 2017 today, Microsoft announced that Visual Studio will be available for the Mac for the first time.",
            "publishedDate": "2016/07/11"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/top/rss",
            "title": "Learn the Basics of the C Programming Language With This Free PDF ",
            "content": "C is one of many programming languages that are useful to learn as a beginner. MagPi, the official Raspberry Pi magazine, put together a book that helpfully walks you through the basics..",
            "publishedDate": "2016/07/11"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/top/rss",
            "title": "Make Your Own Retro Games on iOS With LowRes Coder",
            "content": "iOS: LowRes Coder is a fun app that lets you craft your low-resolution, pixelated games that resemble arcade favorites of yore. It uses the classic BASIC programming language to bring your games to life.",
            "publishedDate": "2016/07/11"
        ],
]
