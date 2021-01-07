//
//  CoreManager.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import Foundation
import CoreData

let core = CoreManager.shared

final class CoreManager {
    
    static let shared = CoreManager()
    private init() {}
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        var container = NSPersistentContainer(name: "CoreData")
        
        container.loadPersistentStores(completionHandler: { (storeDescrip, err) in
            if let error = err {
                fatalError(error.localizedDescription)
            }
        })
        
        return container
    }()
    
    
    
    //MARK: Save
    func save(_ text: History) {
        
        let entity = NSEntityDescription.entity(forEntityName: "CoreTrack", in: context)!
        let core = CoreTrack(entity: entity, insertInto: context)
        
        //KVC - Key Value Coding - access object property by String
        core.setValue(text.searchText, forKey: "searchText")
        print("Saved Fact To Core")
        saveContext()
    }

    //MARK: Delete
    
    func deleteText(_ text: History) {
    
        let fetchRequest = NSFetchRequest<CoreTrack>(entityName: "CoreTrack")
        let predicate = NSPredicate(format: "id==%@", text.searchText!)
        
        print("delete line 3")
        fetchRequest.predicate = predicate
        
        var trackResult = [CoreTrack]()
        
        do {
            trackResult = try context.fetch(fetchRequest)
            
            guard let core = trackResult.first else { return }
            context.delete(core)
            print("Deleted Track From Core: )")
            
        } catch {
            print("Couldn't Fetch Fact: \(error.localizedDescription)")
        }
        
        saveContext()
    }

    //MARK: Load
    func history() -> [History] {
        
        let fetchRequest = NSFetchRequest<CoreTrack>(entityName: "CoreTrack")
        var history = [History]()
    
    do {
        let coreTracks = try context.fetch(fetchRequest)
        for core in coreTracks {
            history.append(History(searchText: core.searchText))
        }
    } catch {
        print("Couldn't Fetch Fact: \(error.localizedDescription)")
    }
    return history
    
    }
    //MARK: Helpers
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
}
