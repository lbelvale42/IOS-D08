//
//  ArticleManager.swift
//  Pods
//
//  Created by Lucas BELVALETTE on 10/13/16.
//
//

import UIKit
import CoreData

open class ArticleManager {
    
    open var managedObjectContext: NSManagedObjectContext
    
    public init() {
        let bundle = Bundle.init(for: lbelvale2016.Article)
        let url = bundle.url(forResource: "article", withExtension: "momd")!
        let mom = NSManagedObjectModel(contentsOf: url)
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom!)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]
        let storeURL = docURL.appendingPathComponent("article.xcdatamodeld")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            print("Error migrating store: \(error)")
        }
       
    }
    
    
    open func newArticle() -> Article {
        var article: Article!
        let context = self.managedObjectContext
        context.performAndWait {
            let ent = NSEntityDescription.entity(forEntityName: "Article", in: context)
            article = Article(entity: ent!, insertInto: context)
        }
        return article
    }
    
    open func getAllArticles() -> [Article] {
        var array: [Article]!
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entityDescription = NSEntityDescription.entity(forEntityName: "Article", in: self.managedObjectContext)
        fetchRequest.entity = entityDescription
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
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
    
    open func getArticles(withLang lang:String) -> [Article] {
        var array: [Article]!
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entityDescription = NSEntityDescription.entity(forEntityName: "Article", in: self.managedObjectContext)
        fetchRequest.entity = entityDescription
        fetchRequest.predicate = NSPredicate(format: "language == %@", lang)
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
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
    
    open func getArticles(containString str: String) -> [Article] {
        var array: [Article]!
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entityDescription = NSEntityDescription.entity(forEntityName: "Article", in: self.managedObjectContext)
        fetchRequest.entity = entityDescription
        fetchRequest.predicate = NSPredicate(format: "title contains %@ || content contains %@", str, str)
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
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
    
    open func removeArticle(_ article : Article) {
        let context = self.managedObjectContext
        context.performAndWait {
            do {
                let context = self.managedObjectContext
                context.delete(article)
                try context.save()
                print("article deleted")
            } catch (let error) {
                print("Failure to delete context: \(error)")
            }
        }
    }
    
    open func save() {
        let context = self.managedObjectContext
        
        context.performAndWait {
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
