//
//  GroceryTableViewCell.swift
//  GroceryList
//
//  Created by Gina De La Rosa on 8/9/16.
//  Copyright © 2016 Gina De La Rosa. All rights reserved.
//

import UIKit

class GroceryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groceryTitle: UILabel!
    @IBOutlet weak var groceryQuantity: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(grocery: GroceryList) {
        groceryTitle.text = grocery.title
        groceryQuantity.text = grocery.quantity
    }

}
