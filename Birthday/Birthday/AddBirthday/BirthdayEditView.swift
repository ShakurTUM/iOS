//  BirthdayEditView.swift
//  Birthday
//  Created by Shakur AL Islam on 28/10/20.

import SwiftUI

struct BirthdayEditView: View {
    @EnvironmentObject var model: Model
    @Environment(\.presentationMode) var presentationMode
    @State private var isAlert = false
    @State private var alertText: String = ""
    @State private var isLoaded: Bool = false
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()}) {
    }}
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @State var isFromEdit: Bool
    @State var birthdayId: UUID?
    
    @State private var name = ""
    @State private var giftIdeas = ""
    @State private var giftsDone = false
    @State private var selectedDate = Date()

    var body: some View {
        if !self.isFromEdit {
            HStack {
                Text("Add Birthday")
                    .bold()
                    .font(.system(size: 25))
                    .padding(15)
                Spacer()
                Button(action: {
                    //self.isAlert = true
                    performSave()
                }, label: {
                    Text("Save")
                        .bold()
                        .frame(width: 100, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(5)
                })
            }
        }
        Form {
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                Text("Name")
                    .bold()
                    .font(.custom(FONT, size: 18.00))
                    .foregroundColor(.blue)
                TextField(self.name, text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Toggle(isOn: $giftsDone) {
                    Text("Gifts Done")
                        .bold()
                        .font(.custom(FONT, size: 18))
                        .foregroundColor(.blue)
                }
                Text("Gift Ideas")
                    .bold()
                    .foregroundColor(.blue)
                    .font(.custom(FONT, size: 18))
                TextEditor(text: $giftIdeas)
                    .foregroundColor(Color.black)
                    .border(Color.gray, width: 1)
                    .font(.custom(FONT, size: 18))
                Text("Select birth date")
                    .bold()
                    .foregroundColor(.blue)
                    .font(.custom(FONT, size: 18))
                DatePicker(selection: $selectedDate, displayedComponents: .date) {
                }.datePickerStyle(WheelDatePickerStyle())
                Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                    .foregroundColor(.blue)
                    .bold()
                    .font(.custom(FONT, size: 18))
            }
        }
        .navigationTitle("Edit Birthday")
        .navigationBarItems(leading: btnBack, trailing:
                                Button("Save") {
                                    performSave()
                                }
        )
        .alert(isPresented: $isAlert, content: {
            Alert(title: Text("Birthday App"), message: Text(self.alertText), dismissButton: .default(Text("Okay")))
        })
        .gesture(DragGesture().onChanged {_ in
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        })
        .onAppear(perform: updateStates)
    }
    
    private func updateStates() {
        if self.isFromEdit {
            if let value = model.birthday(birthdayId)?.name {
                self.name = value
            }
            if let value = model.birthday(birthdayId)?.giftDone {
                self.giftsDone = value
            }
            if let value = model.birthday(birthdayId)?.giftIdeas {
                self.giftIdeas = value
            }
            if let value = model.birthday(birthdayId)?.date {
                self.selectedDate = value
            }
        } else {
            self.giftIdeas = GIFTIDEAS
        }
        self.isLoaded = true
    }
    
    internal func performSave() {
        if !name.isEmpty && name.count > 1 {
            let getTime: [Int] = getFormattedTime(tempDate: selectedDate)
            let bday = Birthdays(
                id: birthdayId,
                name: self.name,
                day: getTime[0],
                month: getTime[1],
                year: getTime[2],
                giftIdeas: self.giftIdeas,
                giftDone: self.giftsDone
            )
            if isFromEdit {
                self.alertText = "Birthday Successfully Updated !"
                self.isAlert = false
            } else {
                self.isAlert = false
            }
            self.model.save(bday)
            self.updateStates()
            self.presentationMode.wrappedValue.dismiss()
        } else {
            self.alertText = "Name should be more than 2 character"
            self.isAlert = true
        }
    }
    
    internal func getFormattedTime(tempDate: Date) -> [Int] {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: tempDate)
        if let day = components.day, let month = components.month, let year = components.year {
            return [day, month, year]
        }
        return [0, 0, 0]
    }
}
struct BirthdayEditView_Previews: PreviewProvider {
    static var bday = Birthdays(id: UUID(), name: "Steve Jobs", day: 25, month: 1, year: 1980, giftIdeas: nil, giftDone: false)
    static var previews: some View {
        BirthdayEditView(isFromEdit: false, birthdayId: UUID())
    }
}
