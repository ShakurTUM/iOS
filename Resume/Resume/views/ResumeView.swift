//  ResumeView.swift
//  Solution01
//  Created by Shakur AL Islam on 27/10/20.

import SwiftUI

struct ResumeView: View {
    let FONT: String = "Helvetica Neue"
    let TITLE: String = "Resume App"
    let resume: Reasume
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    let now = Date()
    
    init() {
        let contact = Contact(id: UUID(), locationName: "Am Stutenanger", country: "Germany", city: "Munich", postCode: "85764")
        let skill = Skill(id: UUID(), name: ["Objective C", "Swift", "iOS Development", "Design Pattern"])
        let education = Education(id: UUID(), name: "Technical University of Munich", department: "Informatik", year: "2018-2020")
        let interest = Interest(id: UUID(), name: ["Software Development", "iOS development", "Learning new things", "Programming"])
        resume = Reasume(id: UUID(),
                         image: "shakur",
                         name: "Shakur AL Islam",
                         education: education,
                         skills: skill,
                         interst: interest,
                         contact: contact,
                         date: Date())
    }
    
    var body: some View {
        NavigationView {
            List {
                Image(resume.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                Text(resume.name)
                    .bold()
                    .font(.custom(FONT, size: 22.00))
                    .padding(10)
                Section(header: Text("Education")
                    .foregroundColor(.blue)) {
                    Text("\(resume.education.name) \("\n") \(resume.education.department) \("\n") \(resume.education.year)")
                        .font(.custom(FONT, size: 18.00))
                        .padding(7.5)
                }
                Section(header: Text("Interests")
                    .foregroundColor(.blue)) {
                    Text(getIntersts().dropLast())
                        .font(.custom(FONT, size: 18.00))
                        .padding(7.5)
                }
                Section(header: Text("Skills")
                    .foregroundColor(.blue)) {
                    Text(getSkills().dropLast())
                        .font(.custom(FONT, size: 18.00))
                        .padding(7.5)
                }
                Section(header: Text("Contact")
                    .foregroundColor(.blue)) {
                    Text("\(resume.contact.locationName) \("\n") \(resume.contact.city) \(resume.contact.country) \("\n") \(resume.contact.postCode)")
                        .font(.custom(FONT, size: 18.00))
                        .padding(7.5)
                }
                Text("Last Updated on \(now, formatter: dateFormatter)")
                    .bold()
                    .font(.custom(FONT, size: 18.00))
                    .foregroundColor(.blue)
            }
            .navigationTitle(TITLE)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    internal func getSkills() -> String {
        var skils: String = ""
        for name in resume.skills.name {
            skils.append(name + "\n")
        }
        return skils
    }
    
    internal func getIntersts() -> String {
        var interests: String = ""
        for name in resume.interst.name {
            interests.append(name + "\n")
        }
        return interests
    }
}

struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView()
    }
}
