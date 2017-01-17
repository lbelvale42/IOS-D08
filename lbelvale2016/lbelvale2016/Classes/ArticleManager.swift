//
//  ArticleManager.swift
//  Pods
//
//  Created by Lucas BELVALETTE on 10/13/16.
//
//

import UIKit
import CoreData

public class ArticleManager {
    
    public var managedObjectContext: NSManagedObjectContext
    
    public init() {
        let bundle = NSBundle.init(forClass: lbelvale2016.Article)
        let url = bundle.URLForResource("article", withExtension: "momd")!
        let mom = NSManagedObjectModel(contentsOfURL: url)
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom!)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let docURL = urls[urls.endIndex-1]
        let storeURL = docURL.URLByAppendingPathComponent("article.xcdatamodeld")
        do {
            try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch {
            print("Error migrating store: \(error)")
        }
       
    }
    
    
    public func newArticle() -> Article {
        var article: Article!
        let context = self.managedObjectContext
        context.performBlockAndWait {
            let ent = NSEntityDescription.entityForName("Article", inManagedObjectContext: context)
            article = Article(entity: ent!, insertIntoManagedObjectContext: context)
        }
        return article
    }
    
    public func getAllArticles() -> [Article] {
        var array: [Article]!
        let fetchRequest = NSFetchRequest()
        let entityDescription = NSEntityDescription.entityForName("Article", inManagedObjectContext: self.managedObjectContext)
        fetchRequest.entity = entityDescription
        do {
            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
            if (result.count > 0) {
                let result = result as! [Article]
                array = result
            }
            else {
                array = []
            }
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return array
    }
    
    public func getArticles(withLang lang:String) -> [Article] {
        var array: [Article]!
        let fetchRequest = NSFetchRequest()
        let entityDescription = NSEntityDescription.entityForName("Article", inManagedObjectContext: self.managedObjectContext)
        fetchRequest.entity = entityDescription
        fetchRequest.predicate = NSPredicate(format: "language == %@", lang)
        do {
            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
            if (result.count > 0) {
                let result = result as! [Article]
                array = result
            }
            else {
                array = []
            }
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return array
    }
    
    public func getArticles(containString str: String) -> [Article] {
        var array: [Article]!
        let fetchRequest = NSFetchRequest()
        let entityDescription = NSEntityDescription.entityForName("Article", inManagedObjectContext: self.managedObjectContext)
        fetchRequest.entity = entityDescription
        fetchRequest.predicate = NSPredicate(format: "title contains %@ || content contains %@", str, str)
        do {
            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
            if (result.count > 0) {
                let result = result as! [Article]
                array = result
            }
            else {
                array = []
            }
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return array
    }
    
    public func removeArticle(article : Article) {
        let context = self.managedObjectContext
        context.performBlockAndWait {
            do {
                let context = self.managedObjectContext
                context.deleteObject(article)
                try context.save()
                print("article deleted")
            } catch (let error) {
                print("Failure to delete context: \(error)")
            }
        }
    }
    
    public func save() {
        let context = self.managedObjectContext
        
        context.performBlockAndWait {
            do {
                let context = self.managedObjectContext
                try context.save()
                print("article saved")
            } catch (let error) {
                print("Failure to save context: \(error)")
            }
        }
    }
    
}