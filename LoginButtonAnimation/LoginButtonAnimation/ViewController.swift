//
//  ViewController.swift
//  LoginButtonAnimation
//
//  Created by YehHenChia on 2017/6/3.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btnTap:ButtonView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.btnTap.addTarget(self, action: #selector(tapMe(sender:)), for: .touchUpInside);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tapMe(sender:UIButton) {
        
        self.btnTap.startAnimation();
    }
}

