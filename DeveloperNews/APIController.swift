//
//  APIController.swift
//  DeveloperNews
//
//  Created by 佐藤和希 on 1/5/17.
//  Copyright © 2017 kaz. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_Synchronous
import SwiftyJSON

class APIController {
    func getJSON(url:String)->JSON?{
        let response = Alamofire.request(url, method: .get).responseJSON(options: .allowFragments)
        if let json = response.result.value {
            print(json)
            return JSON(json)
        }
        
        return nil
    }
}

var feeds: [Dictionary<String, String>] =
    [
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/top/rss",
            "title": "top"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/ruby/rss",
            "title": "ruby"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/ios/rss",
            "title": "ios"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/infrastructure/rss",
            "title": "infrastructure"
        ],
]
