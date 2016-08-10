//
//  ViewController.swift
//  GroceryList
//
//  Created by Gina De La Rosa on 8/9/16.
//  Copyright © 2016 Gina De La Rosa. All rights reserved.
//

import UIKit
import CoreData

var viewSelectedItem:String = ""
var viewSelectedDescription:String = ""
var viewSelectedQuantity:String = ""

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var groceries = [GroceryList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }

    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "GroceryList")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.groceries = results as! [GroceryList]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("GroceryTableViewCell")
            as? GroceryTableViewCell {
            
            let grocery = groceries[indexPath.row]
            cell.configureCell(grocery)
            return cell
        } else {
            return GroceryTableViewCell()
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedRow:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        let groceryItem = groceries[indexPath.row]
        viewSelectedItem = groceryItem.title!
        viewSelectedDescription = groceryItem.foodDescription!
        viewSelectedQuantity = groceryItem.quantity!
        
        if selectedRow.accessoryType == UITableViewCellAccessoryType.None{
            selectedRow.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedRow.tintColor = UIColor.greenColor()
        }
            
        else{
            selectedRow.accessoryType = UITableViewCellAccessoryType.None
            
        }
    }
  
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
    let deletedRow:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
    
    if editingStyle == UITableViewCellEditingStyle.Delete{
    groceries.removeAtIndex(indexPath.row)
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    deletedRow.accessoryType = UITableViewCellAccessoryType.None
    
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceries.count
    }

}

