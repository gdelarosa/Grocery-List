//
//  GroceryList+CoreDataProperties.swift
//  GroceryList
//
//  Created by Gina De La Rosa on 8/9/16.
//  Copyright © 2016 Gina De La Rosa. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension GroceryList {

    @NSManaged var foodDescription: String?
    @NSManaged var quantity: String?
    @NSManaged var title: String?

}
