//
//  MainRecepieViewModel.swift
//  Experiment2
//
//  Created by Jazzband on 01.05.2024.
//

import Foundation

class MainRecepieViewModel: ObservableObject {
    
    @Published var recepieList: [CustomRecepieModel] = []

    func getRecepieList(){
        self.recepieList = RealmServices.shared.getRecepiesList()
    }

    func deleteRecepie(_ recepie: CustomRecepieModel) {
        RealmServices.shared.deleteRecepie(recepie: recepie) {
            getRecepieList()
        }
    }

}
