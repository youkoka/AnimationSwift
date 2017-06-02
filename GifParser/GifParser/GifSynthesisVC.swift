//
//  GifSynthesisVC.swift
//  GifParser
//
//  Created by YehHenChia on 2017/5/15.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit
import ImageIO
import MobileCoreServices

class GifSynthesisVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let dicPathAry = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        
//        let imageAry:NSMutableArray = [];
        let imageAry = NSMutableArray();
        
        for i in 0 ..< 73 {
        
            let dicPath = dicPathAry[0] + "/dog_\(i).png";
            
            let image = UIImage(contentsOfFile: dicPath);
            
            if image != nil {
                
                imageAry.add(image!)
            }
        }
        
        let gifPath = dicPathAry[0] + "/dog.gif";
        
//        let cfGifPath = gifPath as CFString;
        
        let url:CFURL? = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, gifPath as CFString, .cfurlposixPathStyle, false);
        
        let cgImageDestination =  CGImageDestinationCreateWithURL(url!, kUTTypeGIF, imageAry.count, nil);
        
        let propertyGifDic:NSDictionary = [kCGImagePropertyGIFLoopCount : 0, kCGImagePropertyColorModel:kCGImagePropertyColorModelRGB, kCGImagePropertyDepth:16];
        
        let fileProperties:NSDictionary = [kCGImagePropertyGIFDictionary:propertyGifDic];
        
        CGImageDestinationSetProperties(cgImageDestination!, fileProperties);
        
        let propertyFrameDic:NSDictionary = [kCGImagePropertyGIFDelayTime:0.1];
        
        let frameProperties:NSDictionary = [kCGImagePropertyGIFDictionary:propertyFrameDic];
        
        for i in 0 ..< 73 {
        
            let image:UIImage = imageAry[i] as! UIImage;
            
            CGImageDestinationAddImage(cgImageDestination!, image.cgImage!, frameProperties);
        }
        
        if !CGImageDestinationFinalize(cgImageDestination!) {
            
            print("failed to finalize image destination");
        }
        
//        CFRelease(cgImageDestination);
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
