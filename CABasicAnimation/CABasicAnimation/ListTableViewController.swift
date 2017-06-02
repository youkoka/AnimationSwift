//
//  ListTableViewController.swift
//  CABasicAnimation
//
//  Created by YehHenChia on 2017/5/17.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

enum ListCell {
    
    case ListCellTranslate;
    case ListCellScale;
    case ListCellRotation;
    case ListCellCornerRadius;
    case ListCellBorder;
    case ListCellColorAndOpacity;
    case ListCellShadowOffset;
}

class ListTableViewController: UITableViewController {

    let listAry = [ListCell.ListCellTranslate, ListCell.ListCellScale, ListCell.ListCellRotation, ListCell.ListCellCornerRadius, ListCell.ListCellBorder, ListCell.ListCellColorAndOpacity, ListCell.ListCellShadowOffset];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listAry.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let index:ListCell = listAry[indexPath.row];
        
        switch index {
            
        case .ListCellTranslate:
        
            cell.textLabel?.text = "Translate";
        
        case .ListCellScale:
            
            cell.textLabel?.text = "Scale";
            
        case .ListCellBorder:
            
            cell.textLabel?.text = "Border";
            
        case .ListCellShadowOffset:
            
            cell.textLabel?.text = "Shadow Offset";
            
        case .ListCellColorAndOpacity:
            
            cell.textLabel?.text = "Color and Opacity";
            
        case .ListCellCornerRadius:
            
            cell.textLabel?.text = "Corner radius";
            
        case .ListCellRotation:
            
            cell.textLabel?.text = "Rotation";
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index:ListCell = listAry[indexPath.row];
        
        let mainStroyboard = UIStoryboard.init(name: "Main", bundle: nil);
        
        switch index {
            
        case .ListCellTranslate:
            
            let translateAnimationVC = mainStroyboard.instantiateViewController(withIdentifier: "TranslateAnimationVC");
            translateAnimationVC.title = "TranslateAnimation";
            self.navigationController?.pushViewController(translateAnimationVC, animated: true);
            
        case .ListCellScale:
            
            let scaleAnimationVC = mainStroyboard.instantiateViewController(withIdentifier: "ScaleAnimationVC");
            scaleAnimationVC.title = "ScaleAnimation";
            self.navigationController?.pushViewController(scaleAnimationVC, animated: true);
            
        case .ListCellBorder:
            
            let borderAnimationVC = mainStroyboard.instantiateViewController(withIdentifier: "BorderAnimationVC");
            borderAnimationVC.title = "BorderAnimation";
            self.navigationController?.pushViewController(borderAnimationVC, animated: true);
            
        case .ListCellShadowOffset:
            
            let shadowOffsetAnimationVC = mainStroyboard.instantiateViewController(withIdentifier: "ShadowOffsetAnimationVC");
            shadowOffsetAnimationVC.title = "ShadowOffsetAnimation";
            self.navigationController?.pushViewController(shadowOffsetAnimationVC, animated: true);
            
        case .ListCellColorAndOpacity:
            
            let colorAndOpacityAnimationVC = mainStroyboard.instantiateViewController(withIdentifier: "ColorAndOpacityAnimationVC");
            colorAndOpacityAnimationVC.title = "ColorAndOpacityAnimation";
            self.navigationController?.pushViewController(colorAndOpacityAnimationVC, animated: true);

        case .ListCellCornerRadius:
            
            let cornerRadiusAnimationVC = mainStroyboard.instantiateViewController(withIdentifier: "CornerRadiusAnimationVC");
            cornerRadiusAnimationVC.title = "CornerRadiusAnimation";
            self.navigationController?.pushViewController(cornerRadiusAnimationVC, animated: true);

        case .ListCellRotation:
            
            let rotationAnimationVC = mainStroyboard.instantiateViewController(withIdentifier: "RotationAnimationVC");
            rotationAnimationVC.title = "RotationAnimation";
            self.navigationController?.pushViewController(rotationAnimationVC, animated: true);
        }


    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
