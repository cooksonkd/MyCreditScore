//
//  CreditReportInfo.swift
//  MyCreditScore
//
//  Created by User on 2021/06/16.
//

import UIKit

struct CreditReportInfo: Codable {
    let score,
        maxScoreValue,
        minScoreValue,
        percentageCreditUsed,
        currentShortTermDebt,
        currentShortTermNonPromotionalDebt,
        currentShortTermCreditLimit,
        currentShortTermCreditUtilisation,
        changeInShortTermDebt,
        currentLongTermDebt,
        currentLongTermCreditLimit,
        changeInLongTermDebt,
        daysUntilNextReport: Int?
    let equifaxScoreBandDescription: String?
    
    func creditScorePercentage() -> CGFloat {
        // creditScorePercentage set to return -1.0 if one or more of the values are null.
        var creditScorePercentage: CGFloat = -1.0
        if let score = self.score,
           let maxScoreValue = self.maxScoreValue {
            creditScorePercentage = CGFloat(score / maxScoreValue)
        }
        return creditScorePercentage
    }
}
