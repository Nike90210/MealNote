//
//  RealmServices.swift
//  Experiment2
//
//  Created by Jazzband on 18.04.2024.
//

import Foundation
import RealmSwift

class RealmServices {
    static let shared = RealmServices()
    private let bd = try! Realm()
    var config: Realm.Configuration {
        bd.configuration
    }
    private init() {}

    func createDataDB(units: UnitsModel, product: ProductModel, result: ResultModel, complition: ()->()) {
        do {
            try bd.write {
                bd.add(units)
                bd.add(product)
                bd.add(result)
                complition()
            }
        } catch {
            print("Что то пошло не так")
        }
    }

    func createRecepiesList(recepie: CustomRecepieModel, complition: ()->()) {
        do {
            try bd.write {
                bd.add(recepie)
                complition()
            }
        }
        catch {
            print("Что то пошло не так")
        }
    }

    func getRecepiesList() -> [CustomRecepieModel] {
        let recepieList = bd.objects(CustomRecepieModel.self)
        var recepies = [CustomRecepieModel]()
        for recepie in recepieList {
            recepies.append(recepie)
        }
        return recepies
    }

    func getUnitsList() -> [UnitsModel] {
        let unitsList = bd.objects(UnitsModel.self)
        var units = [UnitsModel]()
        for unit in unitsList {
            units.append(unit)
        }
        return units
    }
    func getProdcutList() -> [ProductModel] {
        let productList = bd.objects(ProductModel.self)
        var products = [ProductModel]()
        for product in productList {
            products.append(product)
        }
        return products
    }

    func getResult() -> [ResultModel] {
        let resultList = bd.objects(ResultModel.self)
        var results = [ResultModel]()
        for result in resultList {
            results.append(result)
        }
        return results
    }

    func updateRecepie(_ recepie: CustomRecepieModel,
                       title: String,
                       description: String,
                       ingredients: String,
                       category: String,
                       complition: ()->()) {
        do {
            try bd.write {
                recepie.recepieTitle = title
                recepie.recepieDescription = description
                recepie.inredients = ingredients
                recepie.mealCategory = category
                complition()
            }
        } catch {
            print("Данные не были обновлены")
        }
    }

    func deleteDataFromDB(product: ProductModel, unit: UnitsModel, result: ResultModel, complition: ()->()) {
        do {
            try bd.write {
                bd.delete(product)
                bd.delete(unit)
                bd.delete(result)
                complition()
            }
        } catch {
            print("Не удалось удалить")
        }
    }

    func deleteRecepie(recepie: CustomRecepieModel, complition: ()->()) {
        do {
            try bd.write {
                bd.delete(recepie)
                complition()
            }
        } catch {
            print("не удалось удалить")
        }
    }
}
