//
//  ListTableViewController.swift
//  GifParser
//
//  Created by YehHenChia on 2017/5/15.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

import UIKit

enum kListCell {
    
    case kListCellGifAnalysis;
    case kListCellGifSynthesis;
    case kListCellGifPlay;
}

class ListTableViewController: UITableViewController {

    let listAry = [kListCell.kListCellGifAnalysis, kListCell.kListCellGifSynthesis, kListCell.kListCellGifPlay];
    
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listAry.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let index:kListCell = listAry[indexPath.row];
        
        switch index {
            
        case .kListCellGifAnalysis:
            
            cell.textLabel?.text = "Gif Analysis";
            
        case .kListCellGifSynthesis:

            cell.textLabel?.text = "Gif Synthesis";
            
        case .kListCellGifPlay:
            
            cell.textLabel?.text = "Gif Play";
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil);
        
        let index:kListCell = listAry[indexPath.row];
        
        switch index {
            
        case .kListCellGifAnalysis:
            
            let gifAnalysisVC = mainStoryboard.instantiateViewController(withIdentifier: "GifAnalysisVC");
            gifAnalysisVC.title = "Gif Analysis";
            self.navigationController?.pushViewController(gifAnalysisVC, animated: true);
            
        case .kListCellGifSynthesis:
            
            let gifSynthesisVC = mainStoryboard.instantiateViewController(withIdentifier: "GifSynthesisVC");
            gifSynthesisVC.title = "Gif Synthesis";
            self.navigationController?.pushViewController(gifSynthesisVC, animated: true);
            
        case .kListCellGifPlay:
            
            let gifPlay = mainStoryboard.instantiateViewController(withIdentifier: "GifPlayVC");
            gifPlay.title = "Gif play";
            self.navigationController?.pushViewController(gifPlay, animated: true);
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
