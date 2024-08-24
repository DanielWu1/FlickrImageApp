//
//  FlickrImageAppTests.swift
//  FlickrImageAppTests
//
//  Created by Daniel li on 8/23/24.
//

import XCTest
@testable import FlickrImageApp

final class FlickrImageAppTests: XCTestCase {

    var imageDetailModel: ImageDetailModel!
    
    override func setUpWithError() throws {
        imageDetailModel = ImageDetailModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        imageDetailModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let dateString = "2024-08-22T19:28:46Z"
                
        let formattedDate = imageDetailModel.formatDateString(dateString: dateString)
        XCTAssertEqual(formattedDate, "Aug 22, 2024 at 3:28 PM")
    }
    
    func testFormatDateString_withInvalidDate() throws {
        let invalidDateString = "Hello World"
        
        let formattedDate = imageDetailModel.formatDateString(dateString: invalidDateString)
        print("data:\(formattedDate)")
        XCTAssertEqual(formattedDate, invalidDateString)
    }
    
    func testFormatDateString_withInvalidDateTwo() throws {
        let invalidDateString = "2024-08-22T19:28:46Z"
        
        let formattedDate = imageDetailModel.formatDateString(dateString: invalidDateString)
        XCTAssertNotEqual(formattedDate, "Aug 22, 2024 at 7:28 PM")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
