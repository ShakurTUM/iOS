//
//  Model.swift
//  Todo
//
//  Created by Shakur AL Islam on 1/11/20.
//

import Foundation

public class Model: ObservableObject {
    @Published public internal(set) var birthday: [Birthdays]
    
    init(birthday: [Birthdays]) {
        self.birthday = birthday
    }
    
    func save(_ birthday: Birthdays) {
        self.birthday.replaceAndSort(birthday)
    }
    
    func birthday(_ id: Birthdays.ID) -> Birthdays? {
        self.birthday.first(where: { $0.id == id })
    }
    
    func delete(birthday id: Birthdays.ID) {
        self.birthday.removeAll(where: { $0.id == id })
    }
}
