//
//  SizeCenterAnimationVC.swift
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/8.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

import UIKit

class SizeCenterAnimationVC: UIViewController {

    @IBOutlet weak var btnTap:UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.btnTap.addTarget(self, action: #selector(tapMe(_:)), for: .touchUpInside);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapMe(_ sender:Any)->Void {
    
        UIView.animate(withDuration: 3) { 
          
            self.btnTap.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width - 20, height: self.btnTap.frame.size.height);
            
            self.btnTap.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2);
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
