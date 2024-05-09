//
//  ContentView.swift
//  Experiment2
//
//  Created by Jazzband on 16.04.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ScaleViewModel()

    var body: some View {
        VStack() {
            Spacer()
            VStack(spacing: -2) {
                HStack() {
                    TextField("Введите данные", text: $viewModel.inputTextField)
                        .padding()
                        .background(.white)
                        .shadow(radius: 4)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding()
                    Picker("", selection: $viewModel.scalePickerTop){
                        ForEach(viewModel.units){ unit in
                            Text(unit.title).tag(unit)
                        }
                    }
                    .frame(width: 100, height: 50)
                    .pickerStyle(.automatic)
                    .background(.white)
                    .accentColor(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                }
                HStack() {
                    TextField("000.00", text: $viewModel.outPutText)
                        .padding()
                        .background(.white)
                        .shadow(radius: 4)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding()
                    Picker("", selection: $viewModel.scalePickerBottom){
                        ForEach(viewModel.units){ unit in
                            Text(unit.title).tag(unit)
                        }
                    }
                    .frame(width: 100, height: 50)
                    .pickerStyle(.automatic)
                    .accentColor(.black)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                }
            }
            .padding()
            VStack{
                Button("Посчитать"){
                    viewModel.converter()

                }
                .frame(width: 130)
                .padding()
                .background(Color(.white))
                .foregroundStyle(Color(.black))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Button("Сохранить"){
                    viewModel.saveData()
                    viewModel.getDataFormDB()
                }
                .frame(width: 130)
                .padding()
                .background(Color(.blue))
                .shadow(color: .white, radius: 10, x: 5, y: 7)
                .foregroundStyle(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            VStack {
                Picker("", selection: $viewModel.productPicker) {
                    ForEach(viewModel.product) {tag in
                        Text(tag.title).tag(tag)
                            .foregroundStyle(Color(.white))
                            .fontWeight(.bold)
                            .font(.title2)
                    }
                }
                .frame(width: 300, height: 50)
                .pickerStyle(.wheel)
                .background(Color(.clear))
                .padding()
            }
            VStack {
                List(){
                    ForEach(0 ..< viewModel.getProducts.count, id: \.self) { index in
                        HStack {
                            Text(viewModel.getProducts[index].title)
                            Spacer()
                            Text(viewModel.getResults[index].result)
                            Text(viewModel.getUnits[index].title)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true){
                                    Button("Удалить"){
                                        viewModel.deleteData(viewModel.getProducts[index],
                                                             viewModel.getUnits[index],
                                                             viewModel.getResults[index])
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                }
                .onAppear() {
                    viewModel.getDataFormDB()
                }
                .listStyle(.plain)
            }
            .frame(width: 370, height: 240)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 20)
            .shadow(radius: 4)
            .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(
            Image("monika")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    
    }
}

#Preview {
    ContentView()
}
