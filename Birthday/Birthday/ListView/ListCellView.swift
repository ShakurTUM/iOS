//
//  PostView.swift
//  SwiftUIExample
//
//  Created by Rushi Sangani on 13/06/19.
//  Copyright © 2019 Rushi Sangani. All rights reserved.
//

import Foundation
import SwiftUI

struct ListCellView: View {
    @EnvironmentObject private var model: Model
    @State var isError: Bool = true
    let bday: Birthdays
    @State var birthdayId: UUID?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 10) {
                AvatarView(image: "user", size: 70)
                VStack(alignment: .leading, spacing: 3) {
                    Text(bday.name)
                        .font(.custom("Helvetica Neue", size: 20.00))
                    Group {
                        Text("Turning \(bday.nextAge) on \(bday.formattedDate)")
                        Text(bday.giftIdeas).foregroundColor(.secondary)
                    }.font(.custom("Helvetica Neue", size: 15.00))
                }
                Spacer()
                Text(bday.giftDone ? "🎁" : "🤷‍♂️").multilineTextAlignment(.trailing)
            }
        }
        .padding(.leading, 15)
        .padding(.trailing, 15)
    }
}

struct PostView_Previews: PreviewProvider {
    static var steve = Birthdays(id: UUID(), name: "Steve Jobs", day: 25, month: 10, year: 1980, giftIdeas: "", giftDone: false)
    
    static var previews: some View {
        ListCellView(bday: steve)
    }
}
