//
//  CADisplayLinkAnimationVC.swift
//  SimpleFrameAnimation
//
//  Created by YehHenChia on 2017/5/11.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

class CADisplayLinkAnimationVC: UIViewController {

    var imageView:UIImageView!;
    var index = 0;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 150));
        
        self.view.addSubview(self.imageView);
        
        let displayLink =  CADisplayLink.init(target: self, selector: #selector(animationCircle));
        
        displayLink.preferredFramesPerSecond = 30; //! fps = 30
    
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationCircle() {
        
        index = index % 67;
        
        self.imageView.image = UIImage(named: "\(index).png");
        
        index += 1;
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
