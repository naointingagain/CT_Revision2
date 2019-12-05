//
//  RecipeTableViewController.swift
//  CTRevision2
//
//  Created by MAD2_P01 on 2/12/19.
//  Copyright © 2019 Naomi. All rights reserved.
//

import Foundation
import UIKit

class RecipeTableViewController:UITableViewController{
    
    var recipe:[Recipe] = []
    var ingredient:[Ingredient] = []
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Retrieve recipes and ingredients from core data
        let recipeController:RecipeController = RecipeController()
        recipe = recipeController.RetrieveRecipe()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //Retrieve recipes and ingredients from core datas
        let recipeController:RecipeController = RecipeController()
         recipe = recipeController.RetrieveRecipe()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipe.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let recipeController:RecipeController = RecipeController()
        
        ingredient = RecipeController().RetrieveIngredientfromRecipe(recipe : recipe[indexPath.row])
        
        cell.textLabel?.text = "\(recipe[indexPath.row].name!) (\(recipe[indexPath.row].preparationTime!)mins)"
        
        var s = "Ingredients: "
        
        for ing in ingredient{
            s += "[\(ing.name!)]"
        }
        cell.detailTextLabel!.text = s
        
        return cell
    }
    
}
