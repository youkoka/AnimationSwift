//
//  SimpleRotateDelegateVC.swift
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/9.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

import UIKit

class SimpleRotateDelegateVC: UIViewController {

    @IBOutlet weak var btnTap:UIButton!;
    
    var index:NSInteger = 1;
    var isStop:Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.btnTap.addTarget(self, action: #selector(stopAnimation), for: .touchUpInside);
        
        UIView.beginAnimations(nil, context: nil);
        
        UIView.setAnimationDelegate(self);
        UIView.setAnimationDidStop(#selector(SimpleRotateDelegateVC.animationEnd));
        
        UIView.setAnimationDuration(0.1);
        
        var transform = self.btnTap.transform;
        
        transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2));
        
        self.btnTap.transform = transform;
        
        UIView.commitAnimations();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationEnd() {
        
        UIView.beginAnimations(nil, context: nil);
        
        UIView.setAnimationDuration(0.1);
        
        var transform = self.btnTap.transform;
        
        let angle = CGFloat(M_PI_2) * CGFloat(index);
        
        transform = CGAffineTransform(rotationAngle: angle);
        
        if isStop == false {
        
            index += 1;
            
            UIView.setAnimationDelegate(self);
            UIView.setAnimationDidStop(#selector(SimpleRotateDelegateVC.animationEnd));
        }
        
        self.btnTap.transform = transform;
        
        UIView.commitAnimations();
    }
    
    func stopAnimation() {
        
//        isStop = isStop == true ? false : true;
        
        isStop = !isStop;
        
        if isStop == false {
            
            self.perform(#selector(SimpleRotateDelegateVC.animationEnd));
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
