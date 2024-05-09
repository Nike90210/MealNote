//
//  Products.swift
//  Experiment2
//
//  Created by Jazzband on 17.04.2024.
//

import Foundation
import RealmSwift

class ProductModel: Object, Identifiable {

    @Persisted (primaryKey: true) var id = UUID().uuidString
    @Persisted var title: String
    @Persisted var density: Double

    convenience init(id: String = UUID().uuidString, title: String, density: Double) {
        self.init()
        self.id = id
        self.title = title
        self.density = density
    }
}

extension ProductModel {
    static let products: [ProductModel] = [
        ProductModel(title: "Гречка", density: 0.8),
        ProductModel(title: "Рис", density: 0.9),
        ProductModel(title: "Молоко", density: 1.3),
        ProductModel(title: "Пшеница", density: 0.85),
        ProductModel(title: "Овес", density: 0.68)
    ]
}
