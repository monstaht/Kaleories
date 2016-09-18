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
    let vitamins: [String]
    let healthy: Bool?
    
    init(json: JSON) {
        self.protein = json["protein"].doubleValue
        self.carbs = json["carbs"].doubleValue
        self.fat = json["fat"].doubleValue
        self.calcium = json["calcium"].doubleValue
        self.vitamins = json["vitamins"].arrayValue.map({ $0.stringValue })
        self.healthy = json["healthy"].boolValue
        self.calories = json["calories"].doubleValue
    }
    
    init(json: JSON, healthy: Bool, vitamins: [String]) {
        self.protein = json["protein"].doubleValue
        self.carbs = json["carbs"].doubleValue
        self.fat = json["fat"].doubleValue
        self.calcium = json["calcium"].doubleValue
        self.vitamins = vitamins
        self.healthy = healthy
        self.calories = json["calories"].doubleValue
    }
    
    init(json: JSON, vitamins: [String]) {
        self.protein = json["protein"].doubleValue
        self.carbs = json["carbs"].doubleValue
        self.fat = json["fat"].doubleValue
        self.calcium = json["calcium"].doubleValue
        self.vitamins = vitamins
        self.calories = json["calories"].doubleValue
        self.healthy = nil
    }

}
