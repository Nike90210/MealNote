//
//  CustomRecepieModel.swift
//  Experiment2
//
//  Created by Jazzband on 01.05.2024.
//

import Foundation
import RealmSwift

class CustomRecepieModel: Object, Identifiable {

    @Persisted (primaryKey: true) var id: String
    @Persisted var recepieTitle: String
    @Persisted var recepieDescription: String
    @Persisted var inredients: String
    @Persisted var mealCategory: String

    convenience init(recepieTitle: String, recepieDescription: String, inredients: String, mealCategory: MealType) {
        self.init()
        self.id = UUID().uuidString
        self.recepieTitle = recepieTitle
        self.recepieDescription = recepieDescription
        self.inredients = inredients
        self.mealCategory = mealCategory.rawValue
    }
}

enum MealType: String, CaseIterable {
    case firstDish = "Первое блюдо"
    case secondDish = "Второе блюдо"
    case desert = "Десерт"
    case softDrinks = "Напитки"
}
