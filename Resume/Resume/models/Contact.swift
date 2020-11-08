//  Contact.swift
//  Resume
//  Created by Shakur AL Islam on 31/10/20.

import Foundation

struct Contact {
    var id: UUID?
    var locationName: String
    var country: String
    var city: String
    var postCode: String
    
    init(id: UUID? = nil, locationName: String, country: String, city: String, postCode: String) {
        self.id = id
        self.locationName = locationName
        self.country = country
        self.city = city
        self.postCode = postCode
    }
    
    func send() {
        print("Send Function")
    }
}
