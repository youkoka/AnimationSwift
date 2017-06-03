//
//  CircleView.swift
//  LoginButtonAnimation
//
//  Created by YehHenChia on 2017/6/3.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

protocol CircleViewProtocol {
    
    func didFinishedCircleViewAnimation();
}
class CircleView: UIView, CAAnimationDelegate {

    //! 用來畫圓的路徑
    var circle:CAShapeLayer = CAShapeLayer();
    
    /// 動畫完成後事件
    var circleDelegate:CircleViewProtocol?;
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder);
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame);
        
        let startAngle:CGFloat = -90.0/180.0 * CGFloat.pi;
        let endAngle:CGFloat = -90.01/180.0 * CGFloat.pi;
        
        //! 新增bezier path
        let circlePath = UIBezierPath(arcCenter: CGPoint(x:frame.size.width/2, y:frame.size.height/2) , radius: frame.size.height/2, startAngle: startAngle, endAngle: endAngle, clockwise: true);
        
        circle.path = circlePath.cgPath;
        circle.fillColor = UIColor.clear.cgColor;
        circle.lineCap = kCALineCapRound;
        circle.lineWidth = 3;
        
        self.layer.addSublayer(circle);
    }
    
    /// 開始動畫
    func startStrokeEnd() {
        
        circle.strokeColor = UIColor.red.cgColor;
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd");
        strokeEndAnimation.delegate = self;
        strokeEndAnimation.fromValue = 0;
        strokeEndAnimation.toValue = 1;
        strokeEndAnimation.duration = 2;
        strokeEndAnimation.fillMode = kCAFillModeForwards;
        strokeEndAnimation.isRemovedOnCompletion = false;
        
        circle.add(strokeEndAnimation, forKey: "");
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        if circleDelegate != nil {
            
            circleDelegate?.didFinishedCircleViewAnimation();
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
