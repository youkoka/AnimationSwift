//
//  ViewController.swift
//  Emitter
//
//  Created by YehHenChia on 2017/6/5.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let emitterCell = CAEmitterCell();
        emitterCell.name = "emitter";
//        emitterCell.emissionLongitude = CGFloat.pi;
        emitterCell.emissionRange = CGFloat.pi;
        emitterCell.velocity = 1;
        emitterCell.velocityRange = 100;
        
        emitterCell.scale = 0.1;
        emitterCell.scaleSpeed = 0.1;
        
        emitterCell.yAcceleration = -100;
        emitterCell.lifetime = 4;
        emitterCell.birthRate = 4;
        
        emitterCell.contents = UIImage.init(named: "heart")?.cgImage;
        emitterCell.color = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1).cgColor;

        let emitterLayer = CAEmitterLayer();
        emitterLayer.emitterPosition = self.view.center;
        emitterLayer.renderMode = kCAEmitterLayerAdditive;
        emitterLayer.emitterMode = kCAEmitterLayerOutline;
        emitterLayer.emitterCells = [emitterCell];
        
        self.view.layer.addSublayer(emitterLayer);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

