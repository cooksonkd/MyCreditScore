//
//  DashboardViewController.swift
//  MyCreditScore
//
//  Created by User on 2021/06/14.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var incrementingCreditScoreLabel: UILabel!
    
    // MARK: - Progress bar properties -
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 2
    var creditScorePercentage: CGFloat = 1.0 // To get from api credit score
    
    override func viewDidLoad() {
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
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
    }
    
    // MARK: - Text animation properties -
    var startValue: Double = 0
    let endValue: Double = 705
    let animationDuration: Double = 2
    let animationStartDate = Date()
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
