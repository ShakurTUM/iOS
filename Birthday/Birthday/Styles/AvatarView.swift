//  BirthdayApp.swift
//  Birthday
//  Created by Shakur AL Islam on 28/10/20.

import Foundation
import SwiftUI

struct AvatarView: View {
    let image: String
    let size: CGFloat
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 5))
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(image: "steve", size: 150)
    }
}
