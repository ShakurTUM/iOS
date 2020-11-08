//
//  MockModel.swift
//  Birthday
//
//  Created by Shakur AL Islam on 5/11/20.
//

import Foundation

class MockModel: Model {
    convenience init() {
        let birthdays = [
            Birthdays(
                id: UUID(),
                name: "Paul Schmiedmayer",
                day: 15,
                month: 1,
                year: 1970,
                giftIdeas: nil,
                giftDone: false),
                         
            Birthdays(
                id: UUID(),
                name: "Dora Dzvonyar",
                day: 17,
                month: 11,
                year: 1980,
                giftIdeas: nil,
                giftDone: true),
            
            Birthdays(
                id: UUID(),
                name: "Dominic Henze",
                day: 25,
                month: 1,
                year: 1987,
                giftIdeas: nil,
                giftDone: false),
            
            Birthdays(
                id: UUID(),
                name: "Marko Jovanović",
                day: 9,
                month: 1,
                year: 1980,
                giftIdeas: nil,
                giftDone: true),
            
            Birthdays(
                id: UUID(),
                name: "Sandesh Sharma",
                day: 9,
                month: 9,
                year: 1995,
                giftIdeas: nil,
                giftDone: false)
        ].sorted()
        
        self.init(birthday: birthdays)
    }
    
    override func save(_ bday: Birthdays) {
        var birthday = bday
        if birthday.id == nil {
            birthday.id = UUID()
        }
        super.save(bday)
    }
}
