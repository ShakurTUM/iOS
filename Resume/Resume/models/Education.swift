//  Education.swift
//  Resume
//  Created by Shakur AL Islam on 31/10/20.

import Foundation

struct Education {
    var id: UUID?
    var name: String
    var department: String
    var year: String
    
    init(id: UUID? = nil, name: String, department: String, year: String ) {
        self.id = id
        self.name = name
        self.department = department
        self.year = year
    }
}
