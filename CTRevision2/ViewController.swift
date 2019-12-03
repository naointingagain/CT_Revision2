//
//  ViewController.swift
//  CTRevision2
//
//  Created by MAD2_P01 on 2/12/19.
//  Copyright © 2019 Naomi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtRecipe: UITextField!
    
    @IBOutlet weak var txtPreparationTIme: UITextField!
    
    @IBOutlet weak var txtIngredient1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let recipeController:RecipeController = RecipeController()
        let recipe:Recipe = Recipe(name: txtRecipe.text!, preparationTime: Int16(txtPreparationTIme.text!)!)
        
        let ingredient1:Ingredient = Ingredient(name:txtIngredient1.text!)
        
        recipeController.AddRecipe(recipe : recipe)
        recipeController.AddIngredientToRecipe(recipe : recipe, ingredient: ingredient1)
        txtRecipe.text = ""
        txtPreparationTIme.text = ""
    }

}

