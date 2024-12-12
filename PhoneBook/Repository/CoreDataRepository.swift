//
//  CoreDataRepository.swift
//  PhoneBook
//
//  Created by 김하민 on 12/12/24.
//

import Foundation
import CoreData

class CoreDataRepository {
    
    var contacts: [Entity] = []
    
    let persistentContainer: NSPersistentContainer
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? { fatalError("Unresolved error \(error), \(error.userInfo)") }
        }
    }
    
    var context: NSManagedObjectContext { return persistentContainer.viewContext }
    
    func fetch() {
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        
        do {
            contacts = try self.context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch contacts: \(error)")
        }
    }
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
