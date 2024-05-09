//
//  ResultModel.swift
//  Experiment2
//
//  Created by Jazzband on 01.05.2024.
//

import Foundation
import RealmSwift
class ResultModel: Object, Identifiable {

    @Persisted (primaryKey: true) var id = UUID().uuidString
    @Persisted var result: String

    convenience init(id: String = UUID().uuidString, result: String) {
        self.init()
        self.id = id
        self.result = result
    }
}
