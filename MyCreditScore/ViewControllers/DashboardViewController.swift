//
//  DashboardViewController.swift
//  MyCreditScore
//
//  Created by User on 2021/06/14.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var incrementingCreditScoreLabel: UILabel!
    
    // MARK: - Text animation properties -
    var startValue: Double = 0
    let endValue: Double = 64
    let maxCreditScore: Double = 100
    let animationDuration: Double = 2
    let animationStartDate = Date()
    
    // MARK: - Progress bar properties -
    var circularProgressBarView: CircularProgressBarView!
    var creditScorePercentage = CGFloat() // To get from api credit score
    
    override func viewDidLoad() {
        self.creditScorePercentage = CGFloat(endValue)/CGFloat(maxCreditScore)
        super.viewDidLoad()
        setUpCircularProgressBarView()
        
        // Incrementing Label Code
        let displayLink = CADisplayLink(target: self, selector: #selector(handleTextUpdate))
        displayLink.add(to: .main, forMode: .default)
    }
    
    func setUpCircularProgressBarView() {
        circularProgressBarView = CircularProgressBarView(frame: .zero, creditScorePercentage: creditScorePercentage)
        circularProgressBarView.center = view.center
        view.addSubview(circularProgressBarView)
        circularProgressBarView.progressAnimation(duration: animationDuration)
    }
    
    @objc func handleTextUpdate(){
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        if elapsedTime > animationDuration {
            self.incrementingCreditScoreLabel.text = "\(Int(endValue))"
        } else {
            let percentageOfAnimationDuration = elapsedTime / animationDuration
            let incrementingCreditScoreLabelValue = Int(startValue + percentageOfAnimationDuration  * (endValue - startValue))
            self.incrementingCreditScoreLabel.text = "\(incrementingCreditScoreLabelValue)"
        }
    }
}
