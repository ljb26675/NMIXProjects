//
//  TableViewController.swift
//  Midterm
//
//  Created by Linsey Briley on 3/27/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import WebKit

class TableViewController: UITableViewController, UISearchResultsUpdating {
    
    var dataValues: NSArray = []
    var names: [String] = []
    
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    
    var candidates = 0

    override func viewDidLoad() {
        self.tableView.rowHeight = 100
        
        loadData()
        super.viewDidLoad()
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()

    }
    
    func loadData(){
        let dataUrl = NSURL(string: "https://api.thecatapi.com/v1/breeds?api_key=9925340a-d1d0-48ce-88d5-31bda78cb13e")
        
        let theData = NSData(contentsOf: dataUrl! as URL)
        dataValues = try! JSONSerialization.jsonObject(with: theData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        print(dataValues.count);
        
        for i in 0..<dataValues.count {
            
            let dataLine = dataValues[i]
            print(dataLine);
            //names[i] = (((dataLine as AnyObject)["name"] as? String)!)
            names.insert((((dataLine as AnyObject)["name"] as? String)!), at: i)
            
            
        }
       
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return dataValues.count
        if  (resultSearchController.isActive) {
            return filteredTableData.count
        } else {
            return names.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cat", for: indexPath)
        //let dataLine = dataValues[indexPath.row]
        
        if (resultSearchController.isActive) {
            cell.textLabel?.text = filteredTableData[indexPath.row]
            
            return cell
        }
        else {
            cell.textLabel?.text = names[indexPath.row]
            return cell
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (names as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        
        self.tableView.reloadData()
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStuff"{
            
            let destinationViewController = segue.destination as! ViewController
            var myRow = 0;
            
            if (resultSearchController.isActive) {
                let myIndexPath = self.tableView.indexPathForSelectedRow
                let filteredRow = myIndexPath!.row
                let str = filteredTableData[filteredRow]
                while(str != names[myRow]){
                    myRow+=1;
                }
                
            }else{
                let myIndexPath = self.tableView.indexPathForSelectedRow
                myRow = myIndexPath!.row
            }
            
            destinationViewController.curRow = myRow
            
        }
    }

}
