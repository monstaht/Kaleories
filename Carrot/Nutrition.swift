//
//  Nutrition.swift
//  Router
//
//  Created by Jay Chia on 17/9/16.
//  Copyright © 2016 Jay Chia. All rights reserved.
//

import SwiftyJSON

class Nutrition {
    
    let protein: Double
    let carbs: Double
    let fat: Double
    let calcium: Double
    let calories: Double
    let vitamins: Double
    let healthy: Bool
    
    init(json: JSON) {
        protein = json["protein"].doubleValue
        carbs = json["carbs"].doubleValue
        fat = json["fat"].doubleValue
        calcium = json["calcium"].doubleValue
        vitamins = json["vitamins"].doubleValue
        healthy = json["healthy"].boolValue
        calories = json["calories"].doubleValue
    }

}
