//
//  ButtonView.swift
//  LoginButtonAnimation
//
//  Created by YehHenChia on 2017/6/3.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

class ButtonView: UIButton, CAAnimationDelegate, CircleViewProtocol {

    //! 圓弧框
    var borderView:UIView?;
    
    //! 圓(用來畫圓的動畫)
    var circleView:CircleView?;
    
    var btnWidth:CGFloat = 0.0;
    var btnHeight:CGFloat = 0.0;
    
    var posX:CGFloat = 0.0;
    var posY:CGFloat = 0.0;
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder);
        
        posX = self.bounds.origin.x;
        posY = self.bounds.origin.y;
        
        btnWidth = self.bounds.size.width;
        btnHeight = self.bounds.size.height;
        
        borderView = UIView(frame: CGRect(x: 0, y: 0, width: btnWidth, height: btnHeight));
        
        circleView = CircleView(frame: CGRect(x: 0, y: 0, width: btnWidth, height: btnHeight));
        circleView?.circleDelegate = self;
    }
    
    func startAnimation() {
    
        self.addSubview(borderView!);
        
        //! 縮小範圍
        let boundsAnimation = CABasicAnimation(keyPath: "bounds");
        boundsAnimation.toValue = NSValue.init(cgRect: CGRect(x: posX + (btnWidth - btnHeight) / 2, y: posY, width: btnHeight, height: btnHeight));
        
        //! 圓弧
        let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius");
        let radius = btnHeight / 2;
        cornerRadiusAnimation.toValue = radius ;
        
        //! background color
        let btnBgColorAnimation = CABasicAnimation(keyPath: "backgroundColor");
        btnBgColorAnimation.toValue = UIColor.clear.cgColor;
        
        //! border color
        let borderColorAnimation = CABasicAnimation(keyPath: "borderColor");
        borderColorAnimation.toValue = UIColor.lightGray.cgColor;
        
        //! border width
        let borderWidthAnimaiton = CABasicAnimation(keyPath: "borderWidth");
        borderWidthAnimaiton.fromValue = 0;
        borderWidthAnimaiton.toValue = 2;
        
        //! button 動畫
        let btnAnimationGroup = CAAnimationGroup();
        btnAnimationGroup.animations = [boundsAnimation, cornerRadiusAnimation, btnBgColorAnimation];
        btnAnimationGroup.duration = 2;
        btnAnimationGroup.isRemovedOnCompletion = false;
        btnAnimationGroup.fillMode = kCAFillModeForwards;
        
        //! border動畫
        let borderAnimationGroup = CAAnimationGroup();
        borderAnimationGroup.animations = [boundsAnimation, cornerRadiusAnimation, borderWidthAnimaiton, borderColorAnimation];
        borderAnimationGroup.setValue("borderAnimationGroup", forKey: "borderAnimationGroup");
        borderAnimationGroup.delegate = self;
        borderAnimationGroup.duration = 2;
        borderAnimationGroup.isRemovedOnCompletion = false;
        borderAnimationGroup.fillMode = kCAFillModeForwards;
        
        CATransaction.begin();
        self.borderView?.layer.add(borderAnimationGroup, forKey: "");
        self.layer.add(btnAnimationGroup, forKey: "");
        CATransaction.commit();
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    
        if flag {
            
            let animKey = anim.value(forKey: "borderAnimationGroup");
            let finishAnimKey = anim.value(forKey: "borderFinishAnimationGroup");
            
            if animKey != nil {
                
                if (animKey as! String) == "borderAnimationGroup" {
                    
                    self.addSubview(self.circleView!);
                    
                    self.circleView?.startStrokeEnd();
                }
                
            }
            else if finishAnimKey != nil {
                
                if (finishAnimKey as! String) == "borderFinishAnimationGroup" {
                
                    self.borderView?.removeFromSuperview();
                }
            }
        }
    }
    
    func didFinishedCircleViewAnimation() {
        
        self.circleView?.removeFromSuperview();
        
        //! 縮小範圍
        let boundsAnimation = CABasicAnimation(keyPath: "bounds");
        boundsAnimation.fromValue = NSValue.init(cgRect: CGRect(x: posX + (btnWidth - btnHeight) / 2, y: posY, width: btnHeight, height: btnHeight));
        boundsAnimation.toValue = NSValue.init(cgRect: CGRect(x: 0, y: 0, width: btnWidth, height: btnHeight));
        
        //! 圓弧
        let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius");
        let radius = btnHeight / 2;
        cornerRadiusAnimation.fromValue = radius ;
        cornerRadiusAnimation.toValue = 0;
        
        //! background color
        let btnBgColorAnimation = CABasicAnimation(keyPath: "backgroundColor");
        btnBgColorAnimation.toValue = UIColor.green.cgColor;
        
        //! border color
        let borderColorAnimation = CABasicAnimation(keyPath: "borderColor");
        borderColorAnimation.toValue = UIColor.clear.cgColor;
        
        //! border width
        let borderWidthAnimaiton = CABasicAnimation(keyPath: "borderWidth");
        borderWidthAnimaiton.fromValue = 2;
        borderWidthAnimaiton.toValue = 0;
        
        //! button 動畫
        let btnFinsihAnimationGroup = CAAnimationGroup();
        btnFinsihAnimationGroup.animations = [boundsAnimation, cornerRadiusAnimation, btnBgColorAnimation];
        btnFinsihAnimationGroup.duration = 2;
        btnFinsihAnimationGroup.isRemovedOnCompletion = false;
        btnFinsihAnimationGroup.fillMode = kCAFillModeForwards;
        
        //! border動畫
        let borderFinishAnimationGroup = CAAnimationGroup();
        borderFinishAnimationGroup.animations = [boundsAnimation, cornerRadiusAnimation, borderWidthAnimaiton, borderColorAnimation];
        borderFinishAnimationGroup.setValue("borderFinishAnimationGroup", forKey: "borderFinishAnimationGroup");
        borderFinishAnimationGroup.delegate = self;
        borderFinishAnimationGroup.duration = 2;
        borderFinishAnimationGroup.isRemovedOnCompletion = false;
        borderFinishAnimationGroup.fillMode = kCAFillModeForwards;
        
        CATransaction.begin();
        self.borderView?.layer.add(borderFinishAnimationGroup, forKey: "");
        self.layer.add(btnFinsihAnimationGroup, forKey: "");
        CATransaction.commit();

    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
