//
//  BirthdayApp.swift
//  Birthday
//
//  Created by Shakur AL Islam on 28/10/20.
//

import SwiftUI

@main
struct BirthdayApp: App {
    @State var model: Model = MockModel()
    var body: some Scene {
        WindowGroup {
            BirthdayView()
                .environmentObject(model)
        }
    }
}
