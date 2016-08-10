//
//  itemDetailViewController.swift
//  GroceryList
//
//  Created by Gina De La Rosa on 8/10/16.
//  Copyright © 2016 Gina De La Rosa. All rights reserved.
//

import UIKit
import CoreData

class itemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemNameLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var quantityLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemNameLabel.text = viewSelectedItem
        descriptionLabel.text = viewSelectedDescription
        quantityLabel.text = viewSelectedQuantity
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}
