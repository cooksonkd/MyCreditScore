//
//  MyCreditScoreSlowTests.swift
//  MyCreditScoreSlowTests
//
//  Created by User on 2021/06/20.
//

import XCTest
@testable import MyCreditScore

class MyCreditScoreSlowTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testApiCallCompletes() throws {
        
        // Given
        let urlString = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // When
        if let url = URL(string: urlString) {
            NetworkRequest.fetchRequest(url: url) { _, response, error in
                statusCode = (response as? HTTPURLResponse)?.statusCode
                responseError = error
                promise.fulfill()
            }
        }
        wait(for: [promise], timeout: 5)
        
        // Then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
}
