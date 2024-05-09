//
//  UnitsViewModel.swift
//  Experiment2
//
//  Created by Jazzband on 16.04.2024.
//

import Foundation
import SwiftUI

class ScaleViewModel: ObservableObject {

    @Published var product = ProductModel.products
    @Published var units = UnitsModel.units
    @Published var inputTextField: String = ""
    @Published var outPutText: String = ""
    @Published var scalePickerTop = UnitsModel(title: "", ration: 1.0, isWeight: true)
    @Published var scalePickerBottom = UnitsModel(title: "", ration: 1.0, isWeight: false)
    @Published var productPicker = ProductModel(title: "", density: 0.8)

    @Published var getUnits: [UnitsModel] = []
    @Published var getProducts: [ProductModel] = []
    @Published var getResults: [ResultModel] = []

    init(){
        productInit()
    }

    func productInit(){
        scalePickerTop = units[0]
        scalePickerBottom = units[0]
        productPicker = product[0]
    }

    func converter() {
        guard let inputAmount = Double(inputTextField) else {return}
        let inputScale = scalePickerTop
        let outPutScale = scalePickerBottom
        let productDensity = productPicker
        var result = 0.0
        if  inputScale.isWeight == outPutScale.isWeight {
            result = inputAmount * inputScale.ration / outPutScale.ration
        } else if outPutScale.isWeight {
            result = inputAmount * inputScale.ration / outPutScale.ration / productDensity.density
        } else {
            result = inputAmount * inputScale.ration / outPutScale.ration * productDensity.density
        }
        outPutText = String(format: "%.2f", result)
    }

    func saveData() {
        let unit = UnitsModel(title: scalePickerBottom.title,
                              ration: scalePickerBottom.ration,
                              isWeight: scalePickerBottom.isWeight)
        let product = ProductModel(title: productPicker.title,
                                   density: productPicker.density)
        let result = ResultModel(result: outPutText)

        RealmServices.shared.createDataDB(units: unit, product: product, result: result) {
            print("дааные были сохранены")
        }
    }

    func getDataFormDB() {
        self.getUnits = RealmServices.shared.getUnitsList()
        self.getProducts = RealmServices.shared.getProdcutList()
        self.getResults = RealmServices.shared.getResult()
        print("Данные были получены из БД")
    }

    func deleteData (_ product: ProductModel, _ unit: UnitsModel, _ result: ResultModel) {
        RealmServices.shared.deleteDataFromDB(product: product, unit: unit, result: result) {
            getDataFormDB()
        }
    }
}
