//
//  Recipe.swift
//  CTRevision2
//
//  Created by MAD2_P01 on 2/12/19.
//  Copyright © 2019 Naomi. All rights reserved.
//

import Foundation

class Recipe  //Class to create Recipe to have list of recipes
{
    var name:String?
    var preparationTime:Int16?
    
    init(name:String, preparationTime:Int16) {
        self.name = name
        self.preparationTime = preparationTime
    }
}
