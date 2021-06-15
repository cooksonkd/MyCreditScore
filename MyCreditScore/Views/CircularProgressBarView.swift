//
//  CircularProgressBarView.swift
//  MyCreditScore
//
//  Created by User on 2021/06/14.
//

import UIKit

class CircularProgressBarView: UIView {
    
    // MARK: - Properties -
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startAngle = CGFloat(-Double.pi / 2)
    private var endAngle = CGFloat(3 * Double.pi / 2)
    
    // MARK: - Initializers -
    public init(frame: CGRect, creditScorePercentage: CGFloat) {
        super.init(frame: frame)
        self.createCircularPath(creditScorePercentage: creditScorePercentage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Methods -
    func createCircularPath(creditScorePercentage: CGFloat) {
        let circleLayerCircularPath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width/2.0, y: frame.size.height/2.0),
            radius: 140,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        
        self.circleLayer = self.circlePath (
            path: circleLayerCircularPath.cgPath,
            fillColor: UIColor.clear.cgColor,
            lineCap: .round,
            lineWidth: 7.5,
            strokeEnd: 1.0,
            strokeColor: UIColor.lightGray.cgColor
        )
        
        layer.addSublayer(circleLayer)
        
        let progressLayerEndAngle = (CGFloat(2*Double.pi)*creditScorePercentage)-CGFloat(Double.pi/2)
        
        let progressLayerCircularPath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width/2.0, y: frame.size.height/2.0),
            radius: 132.0,
            startAngle: startAngle,
            endAngle: progressLayerEndAngle,
            clockwise: true)
        
        self.progressLayer = self.circlePath (
            path: progressLayerCircularPath.cgPath,
            fillColor: UIColor.clear.cgColor,
            lineCap: .round,
            lineWidth: 7.5,
            strokeEnd: 0,
            strokeColor: UIColor.cyan.cgColor
        )
        
        layer.addSublayer(progressLayer)
    }
    
    private func circlePath (
        path: CGPath,
        fillColor: CGColor,
        lineCap: CAShapeLayerLineCap,
        lineWidth: CGFloat,
        strokeEnd: CGFloat,
        strokeColor: CGColor
    ) -> CAShapeLayer {
        
        let circlePath = CAShapeLayer()
        circlePath.path = path
        circlePath.fillColor = fillColor
        circlePath.lineCap = lineCap
        circlePath.lineWidth = lineWidth
        circlePath.strokeEnd = strokeEnd
        circlePath.strokeColor = strokeColor
        
        return circlePath
    }
    
    func progressAnimation(duration: TimeInterval) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
