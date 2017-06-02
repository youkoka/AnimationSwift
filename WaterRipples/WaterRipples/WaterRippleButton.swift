//
//  WaterRippleButton.swift
//  WaterRipples
//
//  Created by YehHenChia on 2017/5/24.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

class WaterRippleButton: UIButton {

    var centerX:CGFloat = 0, centerY:CGFloat = 0;
    var radius:CGFloat = 0;
    var count:NSInteger = 0;
    var timer:Timer = Timer();
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder);
    }
    
    func startAnimation(_ sender:UIButton, _ event:UIEvent) {
        
        self.isUserInteractionEnabled = false;
        
        let touchSet:NSSet = event.allTouches! as NSSet;
        
        let touchAry:[AnyObject] = touchSet.allObjects as [AnyObject];
        
        let touch:UITouch = touchAry[0] as! UITouch;
        
        let pt = touch.location(in: self);
        
        centerX = pt.x;
        centerY = pt.y;
        self.count = 0;
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true);
        
        RunLoop.main.add(self.timer, forMode: .defaultRunLoopMode);
    }
    
    func timerAction() {
     
        self.count += 1;
        
        let dispatch_time:DispatchTime = DispatchTime.now() + Double(Int64(0 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC);
      
        DispatchQueue.main.asyncAfter(deadline: dispatch_time, execute: {
        
            () in
           
            self.radius += 1;
            self.setNeedsDisplay();
        });
        
        if self.count > 30 {
            
            self.timer.invalidate();
            
            DispatchQueue.main.asyncAfter(deadline: dispatch_time, execute: { 
               
                self.setNeedsDisplay();
                self.radius = 0;
                self.count = 0;
            });
            
            self.isUserInteractionEnabled = true;
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let ctx = UIGraphicsGetCurrentContext();
        
        let endAngle = CGFloat.pi * 2;
        
        ctx?.addArc(center: CGPoint(x:centerX, y:centerY), radius: radius, startAngle: 0, endAngle: endAngle, clockwise: false);
        
        ctx?.setStrokeColor(UIColor.blue.cgColor);
        ctx?.setFillColor(self.backgroundColor!.cgColor);
        
        ctx?.drawPath(using: .fillStroke);
    }
}
