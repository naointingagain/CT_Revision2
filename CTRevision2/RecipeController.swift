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

class RecipeController{
    
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
        
    }
    
    func RetrieveRecipe()->[Recipe]{
        var recipe:[Recipe] = []
        
        return recipe
    }
    
    func RetrieveIngredientfromRecipe(recipe:Recipe)->[Ingredient]{
        
        var ingredient:[Ingredient] = []
        
        return ingredient
    }
    
    
}
