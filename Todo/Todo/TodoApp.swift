//
//  TodoApp.swift
//  Todo
//
//  Created by Shakur AL Islam on 29/10/20.
//

import SwiftUI

@main
struct TodoApp: App {
    @StateObject var model = Model()
    var body: some Scene {
        WindowGroup {
            TodoView()
                .environmentObject(model)
        }
    }
}
