//
//  MakeMedication.swift
//  Meddie
//
//  Created by Michael Adams on 7/25/20.
//  Copyright © 2020 Michael Adams. All rights reserved.
//

import SwiftUI
import UserNotifications

struct MakeMedication: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var medicationName = ""
    @State var selectedAmount = 1
    @State var dateTaken = Date()
    @State var timeTaken = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Medication name")) {
                    TextField("Enter medication name here...", text: $medicationName)
                }
                Section(header: Text("Amount taken")) {
                    Stepper("Amount: \(selectedAmount)", value: $selectedAmount)
                }
                Section(header: Text("Date and time taken")) {
                    DatePicker(selection: $dateTaken, displayedComponents: .date) {
                        Text("Date")
                    }
                    DatePicker(selection: $timeTaken, displayedComponents: .hourAndMinute) {
                        Text("Time")
                    }
                }
                    
                
                
                Button(action: {
                    guard self.medicationName != "" else {return}
                    let addNewMedication = Medications(context: self.managedObjectContext)
                    addNewMedication.name = self.medicationName
                    addNewMedication.selectedAmount = Int64(self.selectedAmount)
                    addNewMedication.dateTaken = self.dateTaken
                    addNewMedication.timeTaken = self.timeTaken
                    do {
                        try self.managedObjectContext.save()
                        print("Medication saved.")
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }) {
                    Text("Add Medication")
                        .accentColor(.orange)
                }
                .navigationBarTitle("Add Medication")
                
            }.listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            
            
        }
    }
}



struct MakeMedication_Previews: PreviewProvider {
    static var previews: some View {
        MakeMedication()
    }
}
