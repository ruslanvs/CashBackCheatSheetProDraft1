//
//  CoreDataModel.swift
//  CashBackCheatSheetPro
//
//  Created by Ruslan Suvorov on 3/29/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit
import CoreData

class CardModel {
    
    private var managedObjectContext = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    private var appDelegate = ( UIApplication.shared.delegate as! AppDelegate )
    
    static let shared = CardModel()
    
    func getAll() -> [Card] {
        
        let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Card" )
        
//        request.predicate = NSPredicate( format: "isBeasted = %@", beastedState as CVarArg )
        do {
            return try managedObjectContext.fetch( request ) as! [Card]
        } catch {
            print( error )
            return []
        }
    }
    
    func create( title: String, annual_fee: String, cash_back_terms: String, link_to_apply: String, other_terms: String ) -> Card {
        let item = NSEntityDescription.insertNewObject( forEntityName: "Card", into: managedObjectContext ) as! Card
        item.title = title
        item.annual_fee = annual_fee
        item.cash_back_terms = cash_back_terms
        item.link_to_apply = link_to_apply
        item.other_terms = other_terms
        
        saveContext()
        return item
    }
    
    func delete(_ item: Card) {
        managedObjectContext.delete(item)
        saveContext()
    }
    
    func saveContext() {
        appDelegate.saveContext()
    }
}

class RankingCardWithinCategoryModel {
    private var managedObjectContext = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    private var appDelegate = ( UIApplication.shared.delegate as! AppDelegate )
    
    static let shared = RankingCardWithinCategoryModel()
    
    
    func getAll() -> [RankingCardWithinCategory] {
        
        let request = NSFetchRequest<NSFetchRequestResult>( entityName: "RankingCardWithinCategory" )
        
        //        request.predicate = NSPredicate( format: "isBeasted = %@", beastedState as CVarArg )
        do {
            return try managedObjectContext.fetch( request ) as! [RankingCardWithinCategory]
        } catch {
            print( error )
            return []
        }
    }
    
    func create( rank: Int16, card: Card, category: Category ) -> RankingCardWithinCategory {
        let item = NSEntityDescription.insertNewObject( forEntityName: "RankingCardWithinCategory", into: managedObjectContext ) as! RankingCardWithinCategory

        item.rank = rank
        item.card = card
        item.category = category
        
        saveContext()
        return item
    }
    
    func delete(_ item: RankingCardWithinCategory) {
        managedObjectContext.delete(item)
        saveContext()
    }
    
    func saveContext() {
        appDelegate.saveContext()
    }
}


class CategoryModel {
    private var managedObjectContext = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    private var appDelegate = ( UIApplication.shared.delegate as! AppDelegate )
    
    static let shared = CategoryModel()
    

    func getAll() -> [Category] {
        
        let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Category" )
        
        //        request.predicate = NSPredicate( format: "isBeasted = %@", beastedState as CVarArg )
        do {
            return try managedObjectContext.fetch( request ) as! [Category]
        } catch {
            print( error )
            return []
        }
    }
    
    func create(_ data: String) -> Category {
        let item = NSEntityDescription.insertNewObject( forEntityName: "Category", into: managedObjectContext ) as! Category
        //        item.desc = text
        //        item.isBeasted = false
        item.name = data
        saveContext()
        return item
    }
    
    func delete(_ item: Category) {
        managedObjectContext.delete(item)
        saveContext()
    }
    
    func saveContext() {
        appDelegate.saveContext()
    }
}

class MerchantModel {
    
}
