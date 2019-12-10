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
    
    @IBOutlet weak var txtIngredient2: UITextField!
    
    @IBOutlet weak var txtIngredient3: UITextField!
    
    @IBOutlet weak var txtIngredient4: UITextField!
    
    @IBOutlet weak var txtIngredient5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let recipeController:RecipeController = RecipeController()
        
        //if these two values are blank
        if txtRecipe.text == "" || txtPreparationTIme.text == ""{
            let alert = UIAlertController(title: "Empty Field", message: "Please populate both recipe title and preparation time.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Noted", style: .default, handler: nil))
            
            self.present(alert,animated: true)
        }
        else{
            let recipe:Recipe = Recipe(name: txtRecipe.text!, preparationTime: Int16(txtPreparationTIme.text!)!) //create recipe
            
            if txtIngredient1.text == "" && txtIngredient2.text == "" && txtIngredient3.text == "" && txtIngredient4.text == "" && txtIngredient5.text == ""{
                
                let alert = UIAlertController(title: "Empty Field", message: "Please add at least one ingredient.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Noted", style: .default, handler: nil))
                
                self.present(alert,animated: true)
                
            }
            else{
                recipeController.AddRecipe(recipe : recipe) //add recipe method

                
                //add ingredient to recipe
                if txtIngredient1.text != ""{
                    let ingredient1:Ingredient = Ingredient(name:txtIngredient1.text!)
                    
                    recipeController.AddIngredientToRecipe(recipe : recipe, ingredient: ingredient1)
                }
                
                if txtIngredient2.text != ""{
                    let ingredient2:Ingredient = Ingredient(name:txtIngredient2.text!)
                    
                    recipeController.AddIngredientToRecipe(recipe : recipe, ingredient: ingredient2)
                }
                
                if txtIngredient3.text != ""{
                    let ingredient3:Ingredient = Ingredient(name:txtIngredient3.text!)
                    
                    recipeController.AddIngredientToRecipe(recipe : recipe, ingredient: ingredient3)
                }
                
                if txtIngredient4.text != ""{
                    let ingredient4:Ingredient = Ingredient(name:txtIngredient4.text!)
                    
                    recipeController.AddIngredientToRecipe(recipe : recipe, ingredient: ingredient4)
                }
                
                if txtIngredient5.text != ""{
                    let ingredient5:Ingredient = Ingredient(name:txtIngredient5.text!)
                    
                    recipeController.AddIngredientToRecipe(recipe : recipe, ingredient: ingredient5)
                }
                //setting text to empty
                txtRecipe.text = ""
                txtPreparationTIme.text = ""
                txtIngredient1.text = ""
                txtIngredient2.text = ""
                txtIngredient3.text = ""
                txtIngredient4.text = ""
                txtIngredient5.text = ""
            }

        }

    }

}

