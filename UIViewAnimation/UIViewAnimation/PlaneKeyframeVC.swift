//
//  PlaneKeyframeVC.swift
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/10.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

import UIKit

class PlaneKeyframeVC: UIViewController {

    var imagePlane:UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.imagePlane = UIImageView(image: UIImage(named: "Plane"));
        self.imagePlane.contentMode = UIViewContentMode.scaleAspectFit;
        self.imagePlane.frame = CGRect(x: 100, y: 100, width: 50, height: 50);
        self.view.addSubview(self.imagePlane);
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated);
        
        UIView.animateKeyframes(withDuration: 3, delay: 0, options: UIViewKeyframeAnimationOptions.calculationModeLinear, animations: {
          
            //! simple
//            self.imagePlane.frame = CGRect(x: 300, y: 300, width: 100, height: 100);
            
            //! seperate
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
               
                self.imagePlane.frame = CGRect(x: 150, y: 150, width: 30, height: 30);
            });
            
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
               
                self.imagePlane.frame = CGRect(x: 300, y: 300, width: 100, height: 100);
            });
            
        }) { (finished) in
            
            print("done!");
        };
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
