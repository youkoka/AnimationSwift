//
//  TurntableKeyframeVC.swift
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/10.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

import UIKit

class TurntableKeyframeVC: UIViewController {

    @IBOutlet weak var turntable:UIImageView!;
    
    var index:NSInteger = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.animationCircle();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationCircle() {
        
        UIView.animateKeyframes(withDuration: 0.1, delay: 0, options: UIViewKeyframeAnimationOptions(), animations: {
           
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4, animations: { 
            
                let angle = CGFloat.pi/2 * CGFloat(self.index);
                
                self.turntable.transform = CGAffineTransform(rotationAngle: angle)
                
                self.index += 1;
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4, animations: {
                
                let angle = CGFloat.pi/2 * CGFloat(self.index);
                
                self.turntable.transform = CGAffineTransform(rotationAngle: angle)
                
                self.index += 1;
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4, animations: {
                
                let angle = CGFloat.pi/2 * CGFloat(self.index);
                
                self.turntable.transform = CGAffineTransform(rotationAngle: angle)
                
                self.index += 1;
            })
            
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4, animations: {
                
                let angle = CGFloat.pi/2 * CGFloat(self.index);
                
                self.turntable.transform = CGAffineTransform(rotationAngle: angle)
                
                self.index += 1;
            })
            
        }, completion:{ (finished) in 
        
            self.animationCircle();
        });
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
