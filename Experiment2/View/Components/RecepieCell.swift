//
//  RecepieCell.swift
//  Experiment2
//
//  Created by Jazzband on 02.05.2024.
//

import SwiftUI

struct RecepieCell: View {

    @StateObject var cellViewModel: CustomRecepiesViewModel

    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
            Text("\(cellViewModel.title)")

        }.modifier(CellModifire(isShadow: true))
    }
}

#Preview {
    RecepieCell(cellViewModel: CustomRecepiesViewModel(custom: CustomRecepieModel(recepieTitle: "", recepieDescription: "", inredients: "", mealCategory: .desert)))
}
