//
//  MyTableViewController.swift
//  Tableview
//
//  Created by Linsey Briley on 3/19/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var myDataForTable = ["one","two","three","four","five","six"]
    var smallPixForTable = ["1s.jpg","2s.jpg","3s.jpg","4s.jpg","5s.jpg","6s.jpg"]
    var bigPixForView = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg"]
    var textForNewVieW = [
        "one: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam condimentum ac purus vel rhoncus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ",
        "two: nec semper neque molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere",
        "three: Vestibulum id placerat elit. Aenean cursus dui pulvinar risus placerat cubilia Curae; Etiam eleifend mi sit amet facilisis auctor. Donec rhoncus magna at congue pharetra. ",
        "four:  Pellentesque mollis, ipsum ut sodales feugiat, urna libero congue arcu, in rhoncus enim massa ut leo. Morbi erat augue, dignissim non nunc a, sollicitudin rutrum massa. ",
        "five: Fusce interdum dignissim fringilla. Integer a viverra massa, quis consectetur eros. Ut mollis a velit sit amet molestie.",
        "six:  Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris maximus pellentesque dictum."]
    
    
    override func viewDidLoad() {
        self.tableView.rowHeight = 110
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myDataForTable.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Henry", for: indexPath)
        // theImage = "1s.jpg"
        let myContent = myDataForTable[indexPath.row]
        let theImage = smallPixForTable[indexPath.row]
        
        
        // Configure the cell...
        //cell.textLabel?.text = "your name"
        cell.textLabel?.text = myContent
        cell.imageView?.image = UIImage(named: theImage)
        
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
            let destinationViewController = segue.destination as! ShowStuffViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow
            let myRow = myIndexPath!.row
            destinationViewController.myText = textForNewVieW[myRow]
            destinationViewController.myLabel = myDataForTable[myRow]
            destinationViewController.myImage = bigPixForView[myRow]
        }
    }
    

}
