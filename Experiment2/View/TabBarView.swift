//
//  TabBarView.swift
//  Experiment2
//
//  Created by Jazzband on 02.05.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
           ContentView()
                .tabItem {
                    Image(systemName: "x.squareroot")
                    Text("Калькулятор")
                }
          MainRecepieView(viewModel: MainRecepieViewModel())
                .tabItem {
                   Image(systemName: "list.triangle")
                    Text("Рецепты")
                }
        }
        .tint(.purple)
    }
}

#Preview {
    TabBarView()
}
