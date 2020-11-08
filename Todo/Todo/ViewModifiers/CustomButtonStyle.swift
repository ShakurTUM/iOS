//
//  PrimaryButtonStyle.swift
//  Xpense
//
//  Created by Paul Schmiedmayer on 4/09/20.
//  Copyright © 2020 TUM LS1. All rights reserved.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var bgColor: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(
                ZStack {
                    Circle()
                        .stroke(Color.black)
                        .frame(width: 18, height: 18)
                        .padding()
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(bgColor)
                }
            )
    }
}

