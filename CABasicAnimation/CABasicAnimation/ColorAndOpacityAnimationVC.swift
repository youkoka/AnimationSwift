//
//  ColorAndOpacityAnimationVC.swift
//  CABasicAnimation
//
//  Created by YehHenChia on 2017/5/17.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

class ColorAndOpacityAnimationVC: UIViewController {

    @IBOutlet weak var btnTap:UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.btnTap.addTarget(self, action: #selector(tapMe), for: .touchUpInside);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapMe() {
        
        let bgColorAnimation = CABasicAnimation(keyPath: "backgroundColor");
        bgColorAnimation.toValue = UIColor.green.cgColor;
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity");
        opacityAnimation.toValue = 0.2;
        
        let animationGroup = CAAnimationGroup();
        
        animationGroup.animations = [bgColorAnimation, opacityAnimation];
        
        animationGroup.duration = 2.0;
        animationGroup.isRemovedOnCompletion = false;
        animationGroup.fillMode = kCAFillModeForwards;
        
        self.btnTap.layer.add(animationGroup, forKey: nil);
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
