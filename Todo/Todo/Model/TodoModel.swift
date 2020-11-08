//
//  Model.swift
//  Todo
//
//  Created by Shakur AL Islam on 1/11/20.
//

import Foundation

struct OpenTask: Identifiable {
    var id: UUID?
    let name: String
}

extension OpenTask: CustomStringConvertible {
    public var description: String {
        name
    }
}

struct ClosedTask: Identifiable {
    var id: UUID?
    let name: String
}

extension ClosedTask: CustomStringConvertible {
    public var description: String {
        name
    }
}

struct Todos {
    var id: UUID?
    var name: String
    var openTask: [OpenTask]
    var closedTask: [ClosedTask]
    
    init(id: UUID? = nil, name: String, closedTask: [ClosedTask], openTask: [OpenTask]) {
        self.id = id
        self.name = name
        self.openTask = openTask
        self.closedTask = closedTask
    }
}

extension Todos: CustomStringConvertible {
    public var description: String {
        name
    }
}
extension Todos: Identifiable { }

class Model: ObservableObject {
    @Published var todoModel: [Todos]

    init() {
        let closedTask1 = ClosedTask(id: UUID(), name: "Solution for Homewok number S06")
        let openTask1 = OpenTask(id: UUID(), name: "Solution for Homewok number S05")
        let closedTask2 = ClosedTask(id: UUID(), name: "Solution for Homewok number S02")
        let openTask2 = OpenTask(id: UUID(), name: "Solution for Homewok number S01")
        self.todoModel = [Todos(id: UUID(), name: "iPraktikum", closedTask: [closedTask1, closedTask2], openTask: [openTask1, openTask2])]
    }
    
    func getOpenTask() -> Int {
        var openTask: Int = 0
        for todo in self.todoModel where !todo.openTask.isEmpty {
            openTask += (todo.openTask.count)
        }
        return openTask
    }
    
    func getOpenList() -> Int {
        var openList: Int = 0
        for todo in self.todoModel where !todo.openTask.isEmpty {
            openList += 1
        }
        return openList
    }
    
    func setTodo(todo: Todos, index: Int) {
        self.todoModel[index] = todo
    }
    
    func addTodo(todo: Todos) {
        self.todoModel.append(todo)
    }
}
