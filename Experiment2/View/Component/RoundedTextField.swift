//
//  RoundedTextField.swift
//  Experiment2
//
//  Created by Jazzband on 18.04.2024.
//

import SwiftUI

struct RoundedTextField: View {
    @Binding var textField: String

    var body: some View {
        TextField("0000", text: $textField)
            .padding()
            .frame(width: 180, height: 50)
            .background(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 4)
            .padding(.horizontal,4)
    }
}


