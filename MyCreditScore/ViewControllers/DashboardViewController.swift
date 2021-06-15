//
//  DashboardViewController.swift
//  MyCreditScore
//
//  Created by User on 2021/06/14.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var incrementingCreditScoreLabel: UILabel!
    
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 2
    var creditScorePercentage: CGFloat = 0.33333333 // To get from api credit score
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCircularProgressBarView()
    }
    
    func setUpCircularProgressBarView() {
        circularProgressBarView = CircularProgressBarView(frame: .zero, creditScorePercentage: creditScorePercentage)
        circularProgressBarView.center = view.center
        view.addSubview(circularProgressBarView)
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
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
