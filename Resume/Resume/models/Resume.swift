//  Resume.swift
//  Solution01
//  Created by Shakur AL Islam on 28/10/20.

import Foundation

struct Reasume {
    var id: UUID?
    var image: String
    var name: String
    var education: Education
    var skills: Skill
    var interst: Interest
    var contact: Contact
    var date: Date
    
    init(id: UUID? = nil,
         image: String,
         name: String,
         education: Education,
         skills: Skill,
         interst: Interest,
         contact: Contact,
         date: Date = Date()) {
        self.image = image
        self.name = name
        self.education = education
        self.skills = skills
        self.interst = interst
        self.contact = contact
        self.date = date
    }
}

extension Reasume: Identifiable { }
