//
//  ParseJsonController.swift
//  DeveloperNews
//
//  Created by 佐藤和希 on 1/5/17.
//  Copyright © 2017 kaz. All rights reserved.
//

import Foundation
import SwiftyJSON

struct newsContetntsStruct{
    var title : String
    var publishedDate : String
    var link : String
    var contentSnippet : String
}

class ParseJsonController {
    
    func parseJson(feeds:[Dictionary<String, String>])->[[newsContetntsStruct]]{
        let apiController = APIController()
        
        var newsContentsArray = [[newsContetntsStruct]]()
        
        feeds.enumerated().forEach{ index , element in
            let json = apiController.getJSON(url: feeds[index]["link"]!)
            var newsContent : newsContetntsStruct?
            let newsArray = [newsContetntsStruct]()
            newsContentsArray.append(newsArray)
            
            for jsonElement in json!["responseData"]["feed"]["entries"].array!{
                newsContent = newsContetntsStruct(
                    title: jsonElement["title"].stringValue,
                    publishedDate: jsonElement["publishedDate"].stringValue,
                    link: jsonElement["link"].stringValue,
                    contentSnippet:jsonElement["content"].stringValue
                )
                newsContentsArray[index].append(newsContent!)
            }
        }
        
        return newsContentsArray
    }

}
