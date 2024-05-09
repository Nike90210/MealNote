//
//  CustomRecepiesViewModel.swift
//  Experiment2
//
//  Created by Jazzband on 01.05.2024.
//

import Foundation

class CustomRecepiesViewModel: ObservableObject {

    @Published var title = ""
    @Published var description = ""
    @Published var ingredients = ""
    @Published var mealCategory = MealType.firstDish
    var category = MealType.allCases
    var customRecepie: CustomRecepieModel?

    init (custom: CustomRecepieModel) {
        self.title = custom.recepieTitle
        self.description = custom.recepieDescription
        self.ingredients = custom.inredients
        self.mealCategory = MealType(rawValue: custom.mealCategory) ?? .desert
        self.customRecepie = custom
    }

    func saveRecepies() {
        guard !title.isEmpty else { return }

        let recepie = CustomRecepieModel(recepieTitle: title,
                                         recepieDescription: description,
                                         inredients: ingredients,
                                         mealCategory: mealCategory)
        RealmServices.shared.createRecepiesList(recepie: recepie) {
            print("Рецепт был добавлен")
        }
    }

    func updateRecepiesList() {
        guard let customRecepie else { return }
        RealmServices.shared.updateRecepie(customRecepie,
                                           title: title,
                                           description: description,
                                           ingredients: ingredients,
                                           category: mealCategory.rawValue) {
          print("рецепт\(customRecepie) был изменен!")
        }
    }
}
