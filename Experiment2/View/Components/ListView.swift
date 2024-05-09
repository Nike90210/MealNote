//
//  ListView.swift
//  Experiment2
//
//  Created by Jazzband on 08.05.2024.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var viewModel: MainRecepieViewModel

    var body: some View {
            List {
                ForEach(0..<viewModel.recepieList.count, id: \.self) { index in
                    NavigationLink {
                        CreateRecepieView(viewModel: CustomRecepiesViewModel(custom: viewModel.recepieList[index]))
                            .environmentObject(viewModel)
                    } label: {
                        HStack {
                            Image(systemName: "person")
                                .frame(width: 20, height: 20)
                                .padding()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .shadow(radius: 4)

                            Text(viewModel.recepieList[index].recepieTitle)
                                .modifier(CellModifire(isShadow: true))

                        } .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                viewModel.deleteRecepie(viewModel.recepieList[index])
                            } label: {
                                Image(systemName: "trash")
                                    .tint(.red)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
    }
}


#Preview {
    ListView()
}
