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
            //return JSON(json)
        }
        
        return JSON(feedJson)
    }
}


var feeds: [Dictionary<String, String>] =
    [
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/top/rss",
            "title": "Top"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/ruby/rss",
            "title": "Ruby"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/ios/rss",
            "title": "iOS"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/android/rss",
            "title": "Android"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/infrastructure/rss",
            "title": "Infrastructure"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/javascript/rss",
            "title": "Javascript"
        ],
        [
            "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/programming/rss",
            "title": "Programming"
        ]
]
