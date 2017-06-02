//
//  MoveAnimationVC.swift
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/8.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

import UIKit

class MoveAnimationVC: UIViewController {

    @IBOutlet weak var tap1:UIButton!;
    
    @IBOutlet weak var tap2:UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tap1?.addTarget(self, action: #selector(tapMe1(_:)), for: .touchUpInside);
        
        tap2?.addTarget(self, action: #selector(tapMe2(_:)), for: .touchUpInside);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapMe1(_ sender:Any) -> Void {
    
        let frame:CGRect = tap1.frame;
        
        UIView.beginAnimations(nil, context: nil);
        
        UIView.setAnimationDuration(3);
        
        self.tap1.frame = CGRect(x: frame.origin.x, y: frame.origin.y + 100, width: frame.size.width, height: frame.size.height);
        
        UIView.commitAnimations();
    }
    
    @IBAction func tapMe2(_ sender:Any) -> Void {
        
        let frame:CGRect = tap2!.frame;
        
        UIView.animate(withDuration: 3.0) { 
            
            self.tap2?.frame = CGRect(x: frame.origin.x, y: frame.origin.y + 100, width: frame.size.width, height: frame.size.height);
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
