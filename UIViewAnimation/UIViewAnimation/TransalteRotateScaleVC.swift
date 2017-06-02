//
//  TransalteRotateScaleVC.swift
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/9.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

import UIKit

class TransalteRotateScaleVC: UIViewController {

    @IBOutlet weak var btnTap:UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btnTap.addTarget(self, action: #selector(tapMe(_:)), for: .touchUpInside);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tapMe(_ sender:Any) {
    
        self.btnTap.layer.anchorPoint = CGPoint(x:0.5, y:0.5);
        UIView.animate(withDuration: 5.0) { 
          
            var transform = CGAffineTransform.identity;
            
            transform = transform.translatedBy(x: 0, y: 200);
            transform = transform.rotated(by: CGFloat.pi);
            transform = transform.scaledBy(x: 0.5, y: 0.5);
            
            self.btnTap.transform = transform;
        };
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
