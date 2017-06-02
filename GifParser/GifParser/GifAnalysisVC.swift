//
//  GifAnalysisVC.swift
//  GifParser
//
//  Created by YehHenChia on 2017/5/15.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit
import ImageIO

class GifAnalysisVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let filePath:String? = Bundle.main.path(forResource: "dog", ofType: "gif");
        
        let fileData = NSData.init(contentsOfFile: filePath!);
        
        if fileData != nil {
            
//            let cfData = CFDataCreate(kCFAllocatorDefault, UnsafePointer<UInt8>(fileData), fileData?.length);
            
            let cfData = fileData! as CFData;
            
            let imageSource = CGImageSourceCreateWithData(cfData, nil);
            
            let count = CGImageSourceGetCount(imageSource!);
            
            for i in 0 ..< count {
                
                let imageRef =  CGImageSourceCreateImageAtIndex(imageSource!, i, nil);
                
                let image = UIImage.init(cgImage: imageRef!, scale: UIScreen.main.scale, orientation: UIImageOrientation.up);
                
                let imageData = UIImagePNGRepresentation(image);
                
                let dicPathAry = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
                
                let dicPath = dicPathAry[0] + "/dog_\(i).png";
                
                try? imageData?.write(to: URL(fileURLWithPath: dicPath), options: .atomic);
            }
        }
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
