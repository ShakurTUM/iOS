//  TodoListView.swift
//  Todo
//  Created by Shakur AL Islam on 29/10/20.

import SwiftUI

struct TodoListView: View {
    let FONT: String = "Helvetica Neue"
    @State var todos: Todos
    @State var index: Int
    @Environment(\.presentationMode) private var presentationMode
    @State private var presentAddATodo = false
    @EnvironmentObject var model: Model
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                HStack {
                    Text("Open Task")
                        .bold()
                        .foregroundColor(.blue)
                        .font(.system(size: 25))
                    Spacer()
                }
                ForEach(self.model.todoModel[index].openTask.indices, id: \.self) { ind in
                    HStack(spacing: 5) {
                        Button("", action: {
                            updateTask(ind: ind, isFromOpen: true)
                        })
                        .buttonStyle(CustomButtonStyle(bgColor: .clear))
                        Text(self.model.todoModel[index].openTask[ind].name)
                        Spacer()
                    }
                }
                HStack {
                    Text("Closed Task")
                        .bold()
                        .foregroundColor(.blue)
                        .font(.system(size: 25))
                    Spacer()
                }
                ForEach(self.model.todoModel[index].closedTask.indices, id: \.self) { ind in
                    HStack(spacing: 5) {
                        Button("", action: {
                            updateTask(ind: ind, isFromOpen: false)
                        })
                        .buttonStyle(CustomButtonStyle(bgColor: .blue))
                        Text(self.model.todoModel[index].closedTask[ind].name)
                            .strikethrough()
                        Spacer()
                    }
                }
            }
        }
        .sheet(isPresented: $presentAddATodo) {
            TodoAddView(todo: self.model.todoModel[index], isFromAdd: false, index: index, titleString: "Create a new task")
                .environmentObject(model)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationTitle(todos.name)
        .padding(20)
        .toolbar {
            addButton
        }
    }
    
    private var addButton: some View {
        Button(action: { self.presentAddATodo = true }) {
            Image(systemName: "plus")
        }
    }
    
    internal func updateTask(ind: Int, isFromOpen: Bool) {
        if isFromOpen {
            let newTask = ClosedTask(id: model.todoModel[index].openTask[ind].id, name: model.todoModel[index].openTask[ind].name)
            self.model.todoModel[index].closedTask.append(newTask)
            self.model.todoModel[index].openTask.remove(at: ind)
        } else {
            let newTask = OpenTask(id: model.todoModel[index].closedTask[ind].id, name: model.todoModel[index].closedTask[ind].name)
            self.model.todoModel[index].openTask.append(newTask)
            self.model.todoModel[index].closedTask.remove(at: ind)
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static let openTask = OpenTask(name: "Attend app session")
    static let closedTask = ClosedTask(name: "Finished Task 00")
    static var todo1 = Todos(id: UUID(), name: "iPraktikum", closedTask: [closedTask], openTask: [openTask])
    
    static var previews: some View {
        TodoListView(todos: todo1, index: 0)
    }
}
