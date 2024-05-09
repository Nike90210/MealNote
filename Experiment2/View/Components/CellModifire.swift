//
//  CellModifire.swift
//  Experiment2
//
//  Created by Jazzband on 02.05.2024.
//

import Foundation
import SwiftUI

struct CellModifire: ViewModifier {
    var background: Color = .white
    var cornerRadius: CGFloat = 8
    var padding: CGFloat = 16
    var isShadow = false

    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(background)
            .cornerRadius(cornerRadius)
            .shadow(color: .black.opacity(isShadow ? 0.2 : 0), radius: 4, x: 2, y: 4 )
    }
}
