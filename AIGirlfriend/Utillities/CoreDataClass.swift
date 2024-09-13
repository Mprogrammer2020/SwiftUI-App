//
//  CoreDataClass.swift
//  AIGirlfriend
//
//  Created by Netset on 29/07/24.
//

import Foundation
import CoreData

class CoreDataClass {
    static var shared: CoreDataClass {
        return CoreDataClass()
    }
    fileprivate init(){}
    
    // MARK: - Get Models
    func getModelsListMethod(_ completion: @escaping (_ modelsListArr: [String]) -> Void) {
        var arrModelList = [String]()
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: coreDataEntities.Models)
        do {
            let fetchedResults = try managedContext.fetch(fetchRequest)
            if fetchedResults.count > 0 {
                for detailsInfo in fetchedResults {
                    if let modelName = detailsInfo.value(forKeyPath: coreDataEntityKeys.name) as? String {
                        arrModelList.append(modelName)
                    }
                }
            }
            completion(arrModelList)
        } catch let error as NSError {
            debugPrint("Couldn't fetch: \(error), \(error.userInfo)")
            completion(arrModelList)
        }
    }
    
    // MARK: - Save Model in Local DB
    func saveModelInDB(_ modelName:String,modelAge:Int,modelsPersonality:String,modelsInterest:String,completion:@escaping() -> Void) {
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: coreDataName.aiModel, in: managedContext)!
        let objSaveModel = NSManagedObject(entity: entity, insertInto: managedContext)
        //MARK: - Saved Data
        objSaveModel.setValue(modelName, forKey: coreDataEntityKeys.name)
        objSaveModel.setValue(modelAge, forKey: coreDataEntityKeys.age)
        objSaveModel.setValue(modelsInterest, forKey: coreDataEntityKeys.interest)
        objSaveModel.setValue(modelsPersonality, forKey: coreDataEntityKeys.personality)
        do {
            try managedContext.save()
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
    }
    
    // MARK: - Save Chat in Local DB
    func saveChatDataInDB(_ receiverUserName:String,receiverUserMessage:String, receiverUserImage:String, senderUserName:String,senderUserMessage:String,senderUserImage:String,completion:@escaping() -> Void) {
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: coreDataName.aiModel, in: managedContext)!
        let objSaveChat = NSManagedObject(entity: entity, insertInto: managedContext)
        //MARK: - Saved Data
        objSaveChat.setValue(receiverUserName, forKey: coreDataEntityKeys.receiverName)
        objSaveChat.setValue(receiverUserImage, forKey: coreDataEntityKeys.receiverImage)
        objSaveChat.setValue(receiverUserMessage, forKey: coreDataEntityKeys.receiverMessage)
        objSaveChat.setValue(senderUserName, forKey: coreDataEntityKeys.senderName)
        objSaveChat.setValue(senderUserImage, forKey: coreDataEntityKeys.senderImage)
        objSaveChat.setValue(senderUserMessage, forKey: coreDataEntityKeys.senderMessage)
        do {
            try managedContext.save()
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: coreDataName.aiModel)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
}
