//  Skills.swift
//  Resume
//  Created by Shakur AL Islam on 31/10/20.

import Foundation

struct Skill {
    var id: UUID?
    var name: [String]
    
    init(id: UUID? = nil, name: [String]) {
        self.id = id
        self.name = name
    }
}
