//  BirthdayView.swift
//  Birthday
//  Created by Shakur AL Islam on 28/10/20.

import SwiftUI

struct BirthdayView: View {
    @EnvironmentObject var model: Model
    @State private var presentAddEditBirthday = false
    //@State private var loaded: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.model.birthday) { bday in
                    NavigationLink(destination: BirthdayEditView(isFromEdit: true, birthdayId: bday.id)) {
                        ListCellView(bday: bday)
                    }
                }
                .onDelete(perform: delete(at:))
            }
            .padding(.leading, -20)
            .padding(.trailing, -20)
            .toolbar {
                addButton
            }
            .sheet(isPresented: $presentAddEditBirthday) {
                BirthdayEditView(isFromEdit: false, birthdayId: nil)
                    .environmentObject(model)
            }
            .navigationTitle("Upcoming Birthday")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    private func delete(at indexSet: IndexSet) {
        indexSet
            .map { self.model.birthday[$0].id }
            .forEach {
                self.model.delete(birthday: $0)
            }
    }
    private var addButton: some View {
        Button(action: { self.presentAddEditBirthday = true }) {
            Image(systemName: "plus")
        }
    }
}

struct BirthdayView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayView()
            .environmentObject(MockModel() as Model)
    }
}

extension Date {
    init?(_ year: Int, _ month: Int, _ day: Int) {
        guard let date = DateComponents(calendar: .current, year: year, month: month, day: day, hour: 12).date else {
            return nil
        }
        self = date
    }
}
