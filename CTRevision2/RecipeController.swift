//
//  RecipeController.swift
//  CTRevision2
//
//  Created by MAD2_P01 on 2/12/19.
//  Copyright © 2019 Naomi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class RecipeController{ //Refer to telegramme
    
    func AddRecipe(recipe:Recipe){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)!
        let cdRecipe = NSManagedObject(entity: entity, insertInto: context) as! CDRecipe

        cdRecipe.name = recipe.name
        cdRecipe.preparationTime = recipe.preparationTime!
        
        appDelegate.saveContext()
        
    }
    
    func AddIngredientToRecipe(recipe:Recipe, ingredient:Ingredient){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
               let context = appDelegate.persistentContainer.viewContext
               
               let entity = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)!
               let cdIngredient = NSManagedObject(entity: entity, insertInto: context) as! CDIngredient

                
        //FETCH REQUEST
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        
        
        fetchRequest.predicate = NSPredicate(format: "name = %@", recipe.name!)
        
        do{
            let cdRecipe = try context.fetch(fetchRequest)
            let temp = cdRecipe[0] as! CDRecipe
            cdIngredient.addToRecipes(temp)
        } catch {
            print(error)
        }
               
               appDelegate.saveContext()
    }
    
    func RetrieveRecipe()->[Recipe]{
        var recipe:[Recipe] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
                      
                       
               //FETCH REQUEST
               let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
               
               do{
                   let cdRecipe = try context.fetch(fetchRequest) as! [CDRecipe]
                for r in cdRecipe{
                    recipe.append(Recipe(name: r.name!, preparationTime: r.preparationTime))
                }
               } catch {
                   print(error)
               }
        
        return recipe
    }
    
    func RetrieveIngredientfromRecipe(recipe:Recipe)->[Ingredient]{
        
        var ingredient:[Ingredient] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
                      
                       
               //FETCH REQUEST
               let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
        fetchRequest.predicate = NSPredicate(format: "ANY recipes.name = %@", recipe.name!)
               
        
        do{
                          let cdIngredient = try context.fetch(fetchRequest) as! [CDIngredient]
                       for ing in cdIngredient{
                        ingredient.append(Ingredient(name: ing.name!))
                       }
                      } catch {
                          print(error)
                      }
        return ingredient
    }
    
    
}
