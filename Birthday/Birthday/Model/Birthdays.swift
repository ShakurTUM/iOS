//
//  Birthdays.swift
//  Birthday
//
//  Created by Shakur AL Islam on 6/11/20.
//

import Foundation

let GIFTIDEAS: String = "no gift ideas yet"
public struct Birthdays: Decodable, Encodable {
    public var id: UUID?
    var name: String = ""
    var giftIdeas: String = ""
    var giftDone: Bool = false
    var date = Date()

    public var nextAge: Int {
        let ageComponents = Calendar.current.dateComponents([.year], from: date, to: Date())
        guard let age = ageComponents.year else {
            return -1
        }
        return age + 1
    }

    public var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: date)
    }
    
    public init(id: UUID? = nil, name: String, day: Int, month: Int, year: Int, giftIdeas: String? = nil, giftDone: Bool) {
        self.id = id
        self.name = name
        self.giftIdeas = giftIdeas ?? GIFTIDEAS
        self.giftDone = giftDone
        self.date = Self.makeDate(year: year, month: month, day: day)
    }
}

extension Birthdays {
    static func makeDate(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(year: year, month: month, day: day)
        return calendar.date(from: components) ?? Date()
    }
}

// MARK: Account: Comparable
extension Birthdays: Comparable, Equatable {
    public static func < (lhs: Birthdays, rhs: Birthdays) -> Bool {
        lhs.date > rhs.date
    }
    
    public static func == (lhs: Birthdays, rhs: Birthdays) -> Bool {
        lhs.date < rhs.date
    }
}

// MARK: Account: CustomStringConvertible
extension Birthdays: CustomStringConvertible {
    public var description: String {
        name
    }
}

// MARK: Account: Identifiable
extension Birthdays: Identifiable { }

// MARK: Account: Hashable
extension Birthdays: Hashable { }
