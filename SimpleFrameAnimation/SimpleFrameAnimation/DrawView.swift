//
//  DrawView.swift
//  SimpleFrameAnimation
//
//  Created by YehHenChia on 2017/5/11.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var radius:Float = 0.0;
    
    func blackHoleIncrease(radius:Float) {
    
        self.radius = radius;
        
        self.setNeedsDisplay();
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext();
        
        ctx?.addArc(center: CGPoint(x:self.center.x, y:self.center.y), radius: CGFloat(self.radius), startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: false);
        
        ctx?.drawPath(using: .fillStroke);
    }

}
