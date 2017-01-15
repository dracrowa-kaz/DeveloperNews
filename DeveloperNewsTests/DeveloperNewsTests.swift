//
//  DeveloperNewsTests.swift
//  DeveloperNewsTests
//
//  Created by 佐藤和希 on 1/4/17.
//  Copyright © 2017 kaz. All rights reserved.
//

import XCTest
@testable import DeveloperNews

class DeveloperNewsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testConvertXmlToJson(){
        let vc = APIController()
    }
    
    /*
    //MARK: - MainViewController Tests
    func testMainViewControllers(){
        let vc = ButtonBarPagerViewController()
        let vcArray = vc.createViewControllers(feeds: feeds)
        XCTAssertEqual(vcArray.count, feeds.count)
        XCTAssertNotNil(vcArray)
    }
    
    //MARK: - APIController Tests
    func testGetJson(){
        let apiController = APIController()
        for i in 0 ..< feeds.count{
            let json = apiController.getJSON(url: feeds[i]["link"]!)
            XCTAssertNotNil(json)
        }
    }
    
    //MARK: - ParseJsonController Tests
    func testParseJson(){
        for i in 0 ..< feeds.count{
            let parseJsonController = ParseJsonController()
            let structs = parseJsonController.parseJson(feeds: feeds)
            print("Structs count is " + String(structs.count))
            print(structs)
            for (index,element) in structs[i].enumerated() {
                print("i is " + String(i))
                print("index is "+String(index))
                XCTAssertNotEqual(element.title,"")
                XCTAssertNotEqual(element.publishedDate,"")
                XCTAssertNotEqual(element.link,"")
                XCTAssertNotEqual(element.contentSnippet,"")
            }
        }
    }
     */
}
