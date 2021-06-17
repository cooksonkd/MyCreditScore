//
//  DashboardViewController.swift
//  MyCreditScore
//
//  Created by User on 2021/06/14.
//

import UIKit

class DashboardViewController: UIViewController, DataManagerDelegate {

    @IBOutlet weak var incrementingCreditScoreLabel: UILabel!
    
    // MARK: - Text animation properties -
    var startValue: Double = 0
    var endValue: Double = 0
    var maxCreditScore: Double = 100
    let animationDuration: Double = 2
    var animationStartDate: Date?
    
    // MARK: - Progress bar properties -
    var circularProgressBarView: CircularProgressBarView!
    var creditScorePercentage = CGFloat() // To get from api credit score
    
    var displayLink: CADisplayLink?
    
    override func viewDidLoad() {
        DataManager.shared.delegate = self
        self.creditScorePercentage = CGFloat(endValue)/CGFloat(maxCreditScore)
        super.viewDidLoad()
        setUpCircularProgressBarView()
        
    }
    
    func setUpCircularProgressBarView() {
        circularProgressBarView = CircularProgressBarView(frame: .zero, creditScorePercentage: creditScorePercentage)
        circularProgressBarView.center = view.center
        view.addSubview(circularProgressBarView)
        circularProgressBarView.progressAnimation(duration: animationDuration)
    }
    
    @objc func handleTextUpdate(){
        let now = Date()
        
        guard let animationStartDate = animationStartDate else {
            return
        }
        
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        if elapsedTime > animationDuration {
            self.incrementingCreditScoreLabel.text = "\(Int(endValue))"
            if let displayLink = displayLink {
                displayLink.remove(from: .main, forMode: .default)
            }
        } else {
            let percentageOfAnimationDuration = elapsedTime / animationDuration
            let incrementingCreditScoreLabelValue = Int(startValue + percentageOfAnimationDuration  * (endValue - startValue))
            self.incrementingCreditScoreLabel.text = "\(incrementingCreditScoreLabelValue)"
        }
    }
    
    func updateViewController(creditReportInfo: CreditReportInfo?) {
        self.animationStartDate = Date ()
        if let endValue = creditReportInfo?.score,
           let maxCreditScore = creditReportInfo?.maxScoreValue {
            self.endValue = Double(endValue)
            self.maxCreditScore = Double(maxCreditScore)
            viewDidLoad()
            displayLink = CADisplayLink(target: self, selector: #selector(handleTextUpdate))
            displayLink?.add(to: .main, forMode: .default)
        }
    }
}
