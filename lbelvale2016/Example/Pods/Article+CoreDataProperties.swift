//
//  Article+CoreDataProperties.swift
//  
//
//  Created by Lucas BELVALETTE on 10/13/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Article {

    @NSManaged var title: String?
    @NSManaged var content: String?
    @NSManaged var language: String?
    @NSManaged var image: NSData?
    @NSManaged var created_at: NSDate?
    @NSManaged var updated_at: NSDate?

}
