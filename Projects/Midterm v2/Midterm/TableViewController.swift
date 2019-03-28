//
//  TableViewController.swift
//  Midterm
//
//  Created by Linsey Briley on 3/27/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var dataValues: NSArray = []
    var candidates = 0

    override func viewDidLoad() {
        self.tableView.rowHeight = 110
        loadData()
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadData(){
        let dataUrl = NSURL(string: "https://api.thecatapi.com/v1/breeds?api_key=9925340a-d1d0-48ce-88d5-31bda78cb13e")
        let imag1 = "https://www.google.com/search?q="
        //scottishfold
        let imag2 = "&safe=strict&source=lnms&tbm=isch&sa=X&ved=0ahUKEwikmMGTlqHhAhUinuAKHZ5WAFcQ_AUIDigB&biw=1200&bih=822"
        /*let dataUrl = NSMutableURLRequest(url:NSURL(string: "https://api.thecatapi.com/v1/breeds?")! as URL)
         dataUrl.addValue("9925340a-d1d0-48ce-88d5-31bda78cb13e", forHTTPHeaderField: "X-Auth-Token")
         dataUrl.httpMethod = "GET" // or POST or whatever*/
        let theData = NSData(contentsOf: dataUrl! as URL)
        dataValues = try! JSONSerialization.jsonObject(with: theData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        //let dataLine = dataValues[0]
        //let dataLine = dataValues[whichCandidate]
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataValues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Henry", for: indexPath)
        // theImage = "1s.jpg"
        //let myContent = myDataForTable[indexPath.row]
        
        //let myContent = dataValues[indexPath.row]
        let dataLine = dataValues[indexPath.row]
        //let theImage = smallPixForTable[indexPath.row]
        
        
        // Configure the cell...
        //cell.textLabel?.text = "your name"
        //cell.textLabel?.text = myContent
        //cell.imageView?.image = UIImage(named: theImage)
        
        
        cell.textLabel?.text = (dataLine as AnyObject)["name"] as? String
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        
        return cell
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
            let myIndexPath = self.tableView.indexPathForSelectedRow
            let myRow = myIndexPath!.row
            /*destinationViewController.myText = textForNewVieW[myRow]
            destinationViewController.myLabel = myDataForTable[myRow]
            destinationViewController.myImage = bigPixForView[myRow]*/
            
            destinationViewController.curRow = myRow
            
        }
    }

}
