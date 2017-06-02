//
//  DrawViewController.swift
//  SimpleFrameAnimation
//
//  Created by YehHenChia on 2017/5/11.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    var radius:Float = 1;

    let max_radius:Float = 100;
    
    var isIncrease = true;
    
    var drawItem:DrawView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.drawItem = DrawView();
        self.drawItem.frame = self.view.bounds;
        self.drawItem.backgroundColor = UIColor.cyan;
        self.view.addSubview(drawItem);
        
//        drawItem.blackHoleIncrease(radius: 1);
        
        let rate:Double = 1/30;
        
        Timer.scheduledTimer(timeInterval: rate, target: self, selector: #selector(animationCircle), userInfo: nil, repeats: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func animationCircle() {
        
        self.drawItem.blackHoleIncrease(radius: self.radius);
        
        if isIncrease == true && radius <= max_radius {
            
            radius += 1;
        }
        else if isIncrease == false && radius >= 0 {
            
            radius -= 1;
        }
        
        if self.radius >= max_radius {
            
            self.isIncrease = false;
        }
        else if self.radius <= 0 {
            
            self.isIncrease = true;
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
