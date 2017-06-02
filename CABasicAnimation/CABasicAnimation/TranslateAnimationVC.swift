//
//  TranslateAnimationVC.swift
//  CABasicAnimation
//
//  Created by YehHenChia on 2017/5/17.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

class TranslateAnimationVC: UIViewController {

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
        
        let basicAnimation = CABasicAnimation(keyPath: "position");
        
        let posX = self.view.frame.size.width / 2;
        let posY = self.view.frame.size.height - 100;
        
        basicAnimation.toValue = NSValue.init(cgPoint: CGPoint(x: posX, y: posY));
        basicAnimation.duration = 2.0;
        basicAnimation.isRemovedOnCompletion = false;
        basicAnimation.fillMode = kCAFillModeForwards;
        
        self.btnTap.layer.add(basicAnimation, forKey: nil);
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
