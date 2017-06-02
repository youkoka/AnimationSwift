//
//  ListTableViewController.swift
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/8.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

import UIKit

enum kListCell {

    case kListCellMoveAnimation;
    case kListCellSizeCenterAnimation;
    case kListCellAlphaColorAnimation;
    case kListCellTranslateRotateScaleAnimation;
    case kListCellSimpleRotateDelegateAnimation;
    case kListCellPlaneKeyframeAnimation;
    case kListCellTurntableKeyframeAnimation;
}

class ListTableViewController: UITableViewController {

    let listCellAry = [
        kListCell.kListCellMoveAnimation,
        kListCell.kListCellSizeCenterAnimation,
        kListCell.kListCellAlphaColorAnimation,
        kListCell.kListCellTranslateRotateScaleAnimation,
        kListCell.kListCellSimpleRotateDelegateAnimation,
        kListCell.kListCellPlaneKeyframeAnimation,
        kListCell.kListCellTurntableKeyframeAnimation];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "目錄";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listCellAry.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let index:kListCell = listCellAry[indexPath.row];
        
        switch index {
            
        case kListCell.kListCellMoveAnimation:
            
            cell.textLabel?.text = "Move Animation";
            break;
            
        case kListCell.kListCellSizeCenterAnimation:
            
            cell.textLabel?.text = "SizeCetner Animation";
            break;
            
        case .kListCellAlphaColorAnimation:
            
            cell.textLabel?.text = "AlphaColor Animation";
            break;
            
        case .kListCellTranslateRotateScaleAnimation:
            
            cell.textLabel?.text = "TranslateRotateScale Animation";
            break;
            
        case .kListCellSimpleRotateDelegateAnimation:
            
            cell.textLabel?.text = "SimpleRotateDelegate Animation";
            break;
        case .kListCellPlaneKeyframeAnimation:
            
            cell.textLabel?.text = "PlaneKeyframe Animation";
            break;
        case .kListCellTurntableKeyframeAnimation:
            
            cell.textLabel?.text = "TurntableKeyframe Animation";
            break;
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index:kListCell = listCellAry[indexPath.row];
        
        let mainStroyboard = UIStoryboard(name: "Main", bundle: nil);
        
        switch index {
            
        case .kListCellMoveAnimation:
            
            let moveAnimationVC = mainStroyboard.instantiateViewController(withIdentifier: "MoveAnimationVC");
            moveAnimationVC.title = "Move Animation";
            self.navigationController?.pushViewController(moveAnimationVC, animated: true);
            
            break;
        case .kListCellSizeCenterAnimation:
            
            let sizeCetnerVC = mainStroyboard.instantiateViewController(withIdentifier: "SizeCenterAnimationVC");
            sizeCetnerVC.title = "SizeCetner Animation";
            self.navigationController?.pushViewController(sizeCetnerVC, animated: true);
            
            break;
            
        case .kListCellAlphaColorAnimation:
            
            let alphaColorVC = mainStroyboard.instantiateViewController(withIdentifier: "AlphaColorAnimationVC");
            alphaColorVC.title = "AlphaColor Animation";
            self.navigationController?.pushViewController(alphaColorVC, animated: true);
            
            break;
            
        case .kListCellTranslateRotateScaleAnimation:
            
            let translateRotateScaleVC = mainStroyboard.instantiateViewController(withIdentifier: "TransalteRotateScaleVC");
            translateRotateScaleVC.title = "TranslateRotateScale Animation";
            self.navigationController?.pushViewController(translateRotateScaleVC, animated: true);
            break;
            
        case .kListCellSimpleRotateDelegateAnimation:
            
            let simpleRotateDelegateVC = mainStroyboard.instantiateViewController(withIdentifier: "SimpleRotateDelegateVC");
            simpleRotateDelegateVC.title = "SimpleRotateDelegate Animation";
            self.navigationController?.pushViewController(simpleRotateDelegateVC, animated: true);
            break;
        case .kListCellPlaneKeyframeAnimation:
            
            let planeKeyframeVC = mainStroyboard.instantiateViewController(withIdentifier: "PlaneKeyframeVC");
            planeKeyframeVC.title = "PlaneKeyframe Animation";
            self.navigationController?.pushViewController(planeKeyframeVC, animated: true);
            
            break;
        case .kListCellTurntableKeyframeAnimation:
            
            let turntableKeyframeVC = mainStroyboard.instantiateViewController(withIdentifier: "TurntableKeyframeVC");
            turntableKeyframeVC.title = "TurntableKeyframe Animation";
            self.navigationController?.pushViewController(turntableKeyframeVC, animated: true);

            
            break;
        }
    }
}
