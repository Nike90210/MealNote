//
//  Units.swift
//  Experiment2
//
//  Created by Jazzband on 16.04.2024.
//

import Foundation
import RealmSwift

class UnitsModel: Object, Identifiable {

    @Persisted (primaryKey: true)var id = UUID().uuidString
    @Persisted var title: String
    @Persisted var ration: Double
    @Persisted var isWeight: Bool

    convenience init(title: String, ration: Double, isWeight: Bool) {
        self.init()
        self.title = title
        self.ration = ration
        self.isWeight = isWeight
    }
}


extension UnitsModel {
    static let units: [UnitsModel] = [
        UnitsModel(title: "гр", ration: 1.0, isWeight: true),
        UnitsModel(title: "мл", ration: 1.0, isWeight: false),
        UnitsModel(title: "Кг", ration: 1000.0, isWeight: true),
        UnitsModel(title: "Лт", ration: 1000.0, isWeight: false)
    ]
}




