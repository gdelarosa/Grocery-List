//
//  createListViewController.swift
//  GroceryList
//
//  Created by Gina De La Rosa on 8/9/16.
//  Copyright © 2016 Gina De La Rosa. All rights reserved.
//

import UIKit
import CoreData

class createListViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var groceryTitle: UITextField!
    @IBOutlet weak var groceryDescription: UITextField!
    @IBOutlet weak var quantity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addToList(sender: AnyObject!) {
        if let title = groceryTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("GroceryList", inManagedObjectContext: context)!
            let groceryList = GroceryList(entity: entity, insertIntoManagedObjectContext: context)
            groceryList.title = title
            groceryList.foodDescription = groceryDescription.text
            groceryList.quantity = quantity.text
            
            context.insertObject(groceryList)
            
            do {
                try context.save()
            } catch {
                print("Could Not Save")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
