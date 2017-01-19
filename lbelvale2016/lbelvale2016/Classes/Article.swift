//
//  Article.swift
//  Pods
//
//  Created by Lucas BELVALETTE on 10/13/16.
//
//

import UIKit  
import CoreData

open class Article: NSManagedObject {
    @NSManaged open var title: String?
    @NSManaged open var content: String?
    @NSManaged open var language: String?
    @NSManaged open var image: Data?
    @NSManaged open var created_at: Date?
    @NSManaged open var updated_at: Date?
    
    override open var description: String {
        if let t = self.title {
            if let l = self.language {
                return "article : \(t) in language \(l)"
            }
            else {
                return "article : \(self.title) in language \(self.language)"
            }
        }
        else {
            return "article : \(self.title) in language \(self.language)"
        }
    }
}
