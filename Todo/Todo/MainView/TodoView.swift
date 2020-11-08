//  TodoView.swift
//  Todo
//  Created by Shakur AL Islam on 29/10/20.

import SwiftUI

struct TodoView: View {
    @EnvironmentObject var model: Model
    @State private var presentAddTodo = false
    @State var showViews = false
    
    var columns = [
        GridItem(.adaptive(minimum: 140), spacing: 16)
    ]
    
    init() {
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                Text("You have \(self.model.getOpenTask()) open tasks in \(self.model.getOpenList()) list.")
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(10)
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(self.model.todoModel.indices, id: \.self) { index in
                        NavigationLink(destination: TodoListView(todos: self.model.todoModel[index], index: index)) {
                            ZStack {
                                TodoBackground()
                                    .frame(height: 140)
                                VStack(spacing: 10) {
                                    Text(self.model.todoModel[index].name)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.primary)
                                    ZStack {
                                        Circle()
                                            .fill(Color.blue)
                                            .frame(width: 80, height: 80)
                                        VStack {
                                            Group {
                                                Text(String(self.model.todoModel[index].openTask.count))
                                                Text("Open")
                                            }
                                            .foregroundColor(.white)
                                        }
                                    }
                                }.padding()
                            }
                        }
                    }
                }.padding(.horizontal, 16)
            }
            .padding(5)
            .toolbar {
                addButton
            }
            .sheet(isPresented: $presentAddTodo) {
                let todo1 = Todos(id: UUID(), name: "", closedTask: [], openTask: [])
                TodoAddView(todo: todo1, isFromAdd: true, index: 0, titleString: "Create a new list").environmentObject(model)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("TODO List App")
        }
        .onAppear(perform: onAppear)
    }
    private var addButton: some View {
        Button(action: { self.presentAddTodo = true }) {
            Image(systemName: "plus")
        }
    }
    func onAppear() {
        let animation = Animation
            .easeInOut(duration: 0.3)
            .delay(1)
        
        withAnimation(animation) {
            self.showViews = true
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
