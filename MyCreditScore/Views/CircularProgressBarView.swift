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
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    
    // MARK: - Initializers -
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.createCircularPath()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.createCircularPath()
    }
    
    //  MARK: - Methods -
    func createCircularPath() {
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width/2.0, y: frame.size.height/2.0),
            radius: 150,
            startAngle: startPoint,
            endAngle: endPoint,
            clockwise: true)
        
        self.circleLayer = self.circlePath (
            path: circularPath.cgPath,
            fillColor: UIColor.clear.cgColor,
            lineCap: .round,
            lineWidth: 20.0,
            strokeEnd: 1.0,
            strokeColor: UIColor.lightGray.cgColor
        )
        
        layer.addSublayer(circleLayer)
        
        self.progressLayer = self.circlePath (
            path: circularPath.cgPath,
            fillColor: UIColor.clear.cgColor,
            lineCap: .round,
            lineWidth: 18.5,
            strokeEnd: 0,
            strokeColor: UIColor.green.cgColor
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
