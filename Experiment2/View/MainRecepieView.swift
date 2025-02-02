//
//  MainRecepieView.swift
//  Experiment2
//
//  Created by Jazzband on 01.05.2024.
//

import SwiftUI

struct MainRecepieView: View {
    @StateObject var viewModel: MainRecepieViewModel
    @State var isAnimation = false

    var body: some View {
        NavigationView {
            VStack {
                ListView()
                    .environmentObject(viewModel)
                if viewModel.recepieList.isEmpty {
                    Text("Добавте свой первый рецепт")
                }
                if isAnimation {
                    CreateRecepieView(viewModel: CustomRecepiesViewModel(custom: CustomRecepieModel()))
                        .environmentObject(viewModel)
                        .transition(.move(edge: .bottom))
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .shadow(radius: 8)
                        .padding()
                }
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    withAnimation {
                        isAnimation.toggle()
                    }
                } label: {
                    Image(systemName: "plus")
                        .tint(.red)
                        .frame(width: 50, height: 50)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
            }
        }.onAppear {
            viewModel.getRecepieList()
        }
        .padding()
        .background(
            Image("list")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    }

}




#Preview {
    MainRecepieView(viewModel: MainRecepieViewModel())
}
