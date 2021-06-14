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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCircularProgressBarView()
    }
    
    func setUpCircularProgressBarView() {
        // set view
        let frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        circularProgressBarView = CircularProgressBarView(frame: frame)
        // align to the center of the screen
        circularProgressBarView.center = view.center
        // add this view to the view controller
        view.addSubview(circularProgressBarView)
        // call the animation with circularViewDuration
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
