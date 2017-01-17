//
//  Article.swift
//  Pods
//
//  Created by Lucas BELVALETTE on 10/13/16.
//
//

import UIKit  
import CoreData

public class Article: NSManagedObject {
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: NSData?
    @NSManaged public var created_at: NSDate?
    @NSManaged public var updated_at: NSDate?
    
    override public var description: String {
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
