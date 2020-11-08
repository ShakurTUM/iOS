//
//  TodoAddView.swift
//  Todo
//
//  Created by Shakur AL Islam on 29/10/20.
//

import SwiftUI

struct TodoAddView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var model: Model
    @State var name = ""
    @State var todo: Todos
    @State var isFromAdd: Bool
    @State var index: Int
    @State var titleString: String
    @State private var buttonDisabled = false
    @State private var agreedToTerms = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("List title")
                            .font(.system(size: 20))) {
                    TextField("Enter  your list name", text: $name)
                        .onChange(of: name) { newValue in
                            if newValue.count < 4 {
                                agreedToTerms = false
                            } else {
                                agreedToTerms = true
                            }
                        }
                }
                Section(header: Text("Guide Line")
                            .font(.system(size: 20))) {
                    Group {
                        Text("Title should Have at least 4 characters")
                        Text("Title should not to be equal of another list")
                    }
                    .foregroundColor(.gray)
                }
                Section {
                    Button(action: {
                        saveButtonTouched()
                    }) {
                        Text(self.titleString)
                            .bold()
                            .font(.system(size: 20))
                    }
                    .disabled(!agreedToTerms)
                }
            }
            .navigationTitle(self.titleString)
            .toolbar {
                Button("Close") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    internal func saveButtonTouched() {
        if name.count > 3 {
            if isFromAdd {
                self.todo.name = name
                self.model.addTodo(todo: self.todo)
            } else {
                self.todo.openTask.append(OpenTask(id: UUID(), name: name))
                self.model.setTodo(todo: self.todo, index: index)
            }
            self.presentationMode.wrappedValue.dismiss()
        } else {
            print("Put alert")
        }
    }
}

struct TodoAddView_Previews: PreviewProvider {
    static var todo1 = Todos(id: UUID(), name: "iPraktikum", closedTask: [], openTask: [])
    static var previews: some View {
        TodoAddView(todo: todo1, isFromAdd: false, index: 0, titleString: "Title")
    }
}
