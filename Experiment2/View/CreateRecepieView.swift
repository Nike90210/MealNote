//
//  CreateRecepieView.swift
//  Experiment2
//
//  Created by Jazzband on 01.05.2024.
//

import SwiftUI

struct CreateRecepieView: View {
    @StateObject var viewModel: CustomRecepiesViewModel
    @EnvironmentObject var mainViewModel: MainRecepieViewModel
    @Environment (\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 1) {
            TextField("Введите названия рецепта", text: $viewModel.title)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 2)
                .padding()
            Text("Опишите пособ пригтовления:")
                .foregroundStyle(Color(.white))
            TextEditor(text: $viewModel.description)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 2)
                .padding()
            Text("Список ингредиентов:")
                .foregroundStyle(Color(.white))
                .bold()
            TextEditor(text: $viewModel.ingredients)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 2)
                .padding()
            Picker("", selection: $viewModel.mealCategory) {
                ForEach(viewModel.category, id: \.self) { tag in
                    Text(tag.rawValue).tag(tag)
                }
            }
            .tint(.white)
            Button {
                if let _ = viewModel.customRecepie {
                    viewModel.updateRecepiesList()
                } else {
                    viewModel.saveRecepies()
                }
                mainViewModel.getRecepieList()
                dismiss()
            } label: {
                Text("Сохранить")
                    .padding(.horizontal, 80)
                    .padding(.vertical, 14)
                    .background(.purple)
                    .shadow(radius: 8)
                    .foregroundStyle(Color(.white))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("stag")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    }
}


#Preview {

    CreateRecepieView(viewModel: CustomRecepiesViewModel(custom: CustomRecepieModel(recepieTitle: "", recepieDescription: "", inredients: "", mealCategory: .desert)))
}
