//
//  CreditReportViewController.swift
//  MyCreditScore
//
//  Created by User on 2021/06/20.
//

import UIKit

class CreditReportViewController: UIViewController {
    
    @IBOutlet weak var creditScoreLabel: UILabel!
    @IBOutlet weak var maximumScoreValueLabel: UILabel!
    @IBOutlet weak var percentageCreditUsedLabel: UILabel!
    @IBOutlet weak var currentShortTermDebtLabel: UILabel!
    @IBOutlet weak var changeInShortTermDebtLabel: UILabel!
    @IBOutlet weak var currentLongTermDebtLabel: UILabel!
    @IBOutlet weak var changeInLongTermDebtLabel: UILabel!
    @IBOutlet weak var daysUntilNextReportLabel: UILabel!
    @IBOutlet weak var equifaxScoreBandDescriptionLabel: UILabel!
    
    var creditReportInfo: CreditReportInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setProperties()
    }
    
    func setCreditReportInfo(creditReportInfo: CreditReportInfo?) {
        self.creditReportInfo = creditReportInfo
    }

    func setProperties() {
        if let creditScore = creditReportInfo?.score {
            creditScoreLabel.text = "\(creditScore)"
        } else {
            creditScoreLabel.text = "N/A"
        }
        
        if let maximumCreditScore = creditReportInfo?.maxScoreValue {
            maximumScoreValueLabel.text = "\(maximumCreditScore)"
        } else {
            maximumScoreValueLabel.text = "N/A"
        }
        
        if let percentageCreditUsed = creditReportInfo?.percentageCreditUsed {
            percentageCreditUsedLabel.text = "\(percentageCreditUsed)%"
        } else {
            percentageCreditUsedLabel.text = "N/A"
        }
        
        if let currentShortTermDebt = creditReportInfo?.currentShortTermDebt {
            currentShortTermDebtLabel.text = "R\(currentShortTermDebt)"
        } else {
            currentShortTermDebtLabel.text = "N/A"
        }
        
        if let changeInShortTermDebt = creditReportInfo?.changeInShortTermDebt {
            changeInShortTermDebtLabel.text = "\(changeInShortTermDebt)"
        } else {
            changeInShortTermDebtLabel.text = "N/A"
        }
        
        if let currentLongTermDebt = creditReportInfo?.currentLongTermDebt {
            currentLongTermDebtLabel.text = "R\(currentLongTermDebt)"
        } else {
            currentLongTermDebtLabel.text = "N/A"
        }
        
        if let changeInLongTermDebt = creditReportInfo?.changeInLongTermDebt {
            changeInLongTermDebtLabel.text = "\(changeInLongTermDebt)"
        } else {
            changeInLongTermDebtLabel.text = "N/A"
        }
        
        if let daysUntilNextReport = creditReportInfo?.daysUntilNextReport {
            daysUntilNextReportLabel.text = "\(daysUntilNextReport)"
        } else {
            daysUntilNextReportLabel.text = "N/A"
        }
        
        if let equifaxScoreBandDescription = creditReportInfo?.equifaxScoreBandDescription {
            equifaxScoreBandDescriptionLabel.text = "\(equifaxScoreBandDescription)"
        } else {
            equifaxScoreBandDescriptionLabel.text = "N/A"
        }
    }
}
