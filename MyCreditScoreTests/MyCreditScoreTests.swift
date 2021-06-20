//
//  MyCreditScoreTests.swift
//  MyCreditScoreTests
//
//  Created by User on 2021/06/20.
//

import XCTest
@testable import MyCreditScore

class MyCreditScoreTests: XCTestCase {
    
    var sut:CreditReportInfo!

    override func setUpWithError() throws {
        sut = CreditReportInfo(
            score: 30,
            maxScoreValue: 100,
            minScoreValue: nil,
            percentageCreditUsed: nil,
            currentShortTermDebt: nil,
            currentShortTermNonPromotionalDebt: nil,
            currentShortTermCreditLimit: nil,
            currentShortTermCreditUtilisation: nil,
            changeInShortTermDebt: nil,
            currentLongTermDebt: nil,
            currentLongTermCreditLimit: nil,
            changeInLongTermDebt: nil,
            daysUntilNextReport: nil,
            equifaxScoreBandDescription: nil)
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testCreditScorePercentage() throws {
        // Given:
        // - Credit score
        // - Maximum credit score value
        
        // When:
        let creditScorePercentage = sut.creditScorePercentage()
        let expectedResult = 0.3
        
        XCTAssertEqual(creditScorePercentage, 0.3, "Credit score is \(creditScorePercentage) instead of \(expectedResult).")
    }
}
