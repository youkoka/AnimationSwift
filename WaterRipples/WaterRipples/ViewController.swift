//
//  ViewController.swift
//  WaterRipples
//
//  Created by YehHenChia on 2017/5/24.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btnTap:WaterRippleButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnTap.addTarget(self, action: #selector(tapMe(sender:event:)), for: .touchUpInside);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tapMe(sender:UIButton, event:UIEvent) {
        
        btnTap.startAnimation(sender, event);
    }
    
}

