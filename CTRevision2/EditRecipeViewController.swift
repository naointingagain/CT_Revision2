//
//  EditRecipeViewController.swift
//  CTRevision2
//
//  Created by MAD2 on 9/12/19.
//  Copyright © 2019 Naomi. All rights reserved.
//

import Foundation

import UIKit

class EditRecipeViewController:UIViewController{
    
    @IBOutlet weak var editTitle: UITextField!
    
    @IBOutlet weak var editPrepTime: UITextField!
    
    @IBOutlet weak var editIng1: UITextField!
    
    @IBOutlet weak var editIng2: UITextField!
    
    @IBOutlet weak var editIng3: UITextField!
    
    @IBOutlet weak var editIng4: UITextField!
    
    @IBOutlet weak var editIng5: UITextField!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recipeList = RecipeController().RetrieveRecipe()
        
        let recipe = recipeList[AppDelegate.temp]
        
        //retrieve ingredients for specific recipes
        //let ingredient = RecipeController().RetrieveIngredientfromRecipe(recipe: recipe)
        
        //display existing contact details
        editTitle.text = recipe.name
        editPrepTime.text = "\(recipe.preparationTime!)"
    }
    
    @IBAction func editSave(_ sender: Any) {
        let recipeList = RecipeController().RetrieveRecipe()
        
        let recipe = recipeList[AppDelegate.temp] //retrieve specific cell that is in temp
        
        //updating contact based on the text in textfield
        let newRecipe:Recipe = Recipe(name: editTitle.text!, preparationTime: Int16(editPrepTime.text!)!)
        
        RecipeController().updateRecipe(name: recipe.name!, newRecipe: newRecipe)
    
    }
}
