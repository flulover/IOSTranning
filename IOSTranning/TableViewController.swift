//
//  TableViewController.swift
//  IOSTranning
//
//  Created by twer on 6/8/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var dataModel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        self.title = self.dataModel.title

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func initData(){
        let jsonParser:JSONParser = JSONParser()
        let jsonData = jsonParser.loadJSONFile()
        self.dataModel.title = jsonData["title"].string!
        
        for (key, itemData) in jsonData["rows"]{
            self.dataModel.items.addObject(Item(title:itemData["title"].stringValue, description:itemData["description"].stringValue, imageHref:itemData["imageHref"].stringValue))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.dataModel.items.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row //2
        let section = indexPath.section//3
        let item = dataModel.items[row] as! Item
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as! ItemTableViewCell;

        
        var item: Item = self.dataModel.items.objectAtIndex(indexPath.row) as! Item;
        cell.titleLabel.font = UIFont.boldSystemFontOfSize(24)
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.itemDescription


        if (item.imageHref != ""){
            var url = NSURL(string: item.imageHref)
            var data = NSData(contentsOfURL : url!)
            if (data != nil){
                var image = UIImage(data : data!)
                cell.imageComponent.image = image
            }
        }
        
        return cell;
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "detailSegue")
        {
            let item = sender as! ItemTableViewCell
            let itemDetailViewController = segue.destinationViewController as! ItemDetailViewController
            
            itemDetailViewController.itemTableViewCell = item
        }
    }

}
