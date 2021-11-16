//
//  MakeMyMedication.swift
//  Meddie
//
//  Created by Michael Adams on 8/1/20.
//  Copyright © 2020 Michael Adams. All rights reserved.
//

import SwiftUI

struct MakeMyMedication: View {
    @Environment(\.managedObjectContext) var managedObjectContext
       @Environment (\.presentationMode) var presentationMode
    
    
    @State var name = ""
    @State var lastTaken = Date()
    @State var timeToTake = Date()
    @State var numberToTake = 1
    
    @State var selectedTimeOfDayIndex = 0
    var timeOfDayOptions = ["Morning", "Afternoon", "Evening", "Night"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Medication name")) {
                    TextField("Enter medication name here...", text: $name)
                }
                Section(header: Text("Amount to take")) {
                    Stepper("Amount: \(numberToTake)", value: $numberToTake)
                }
                Section(header: Text("Times to take")) {
                    DatePicker(selection: $timeToTake, displayedComponents: .hourAndMinute) {
                        Text("Time")
                    }
                    Picker("Time of day", selection: $selectedTimeOfDayIndex) {
                        ForEach(0..<timeOfDayOptions.count) {
                            Text(self.timeOfDayOptions[$0])
                        }
                        }.pickerStyle(SegmentedPickerStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    
                    }
                
                Button(action: {
                    guard self.name != "" else {return}
                    if self.selectedTimeOfDayIndex == 0 {
                        let addNewMorningMedication = MorningMedication(context: self.managedObjectContext)
                        addNewMorningMedication.name = self.name
                        addNewMorningMedication.numberToTake = Int64(self.numberToTake)
                        addNewMorningMedication.timeToTake = self.timeToTake
                        addNewMorningMedication.lastTaken = Date()
                        do {
                            try self.managedObjectContext.save()
                            print("Medication saved.")
                            self.presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    else if self.selectedTimeOfDayIndex == 1 {
                        let addNewAfternoonMedication = AfternoonMedication(context: self.managedObjectContext)
                        addNewAfternoonMedication.name = self.name
                        addNewAfternoonMedication.numberToTake = Int64(self.numberToTake)
                        addNewAfternoonMedication.timeToTake = self.timeToTake
                        addNewAfternoonMedication.lastTaken = Date()
                        do {
                            try self.managedObjectContext.save()
                            print("Medication saved.")
                            self.presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    else if self.selectedTimeOfDayIndex == 2 {
                        let addNewEveningMedication = EveningMedication(context: self.managedObjectContext)
                        addNewEveningMedication.name = self.name
                        addNewEveningMedication.numberToTake = Int64(self.numberToTake)
                        addNewEveningMedication.timeToTake = self.timeToTake
                        addNewEveningMedication.lastTaken = Date()
                        do {
                            try self.managedObjectContext.save()
                            print("Medication saved.")
                            self.presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    else if self.selectedTimeOfDayIndex == 3 {
                        let addNewNightMedication = NightMedication(context: self.managedObjectContext)
                        addNewNightMedication.name = self.name
                        addNewNightMedication.numberToTake = Int64(self.numberToTake)
                        addNewNightMedication.timeToTake = self.timeToTake
                        addNewNightMedication.lastTaken = Date()
                        do {
                            try self.managedObjectContext.save()
                            print("Medication saved.")
                            self.presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                
                }) {
                    Text("Create Medication")
                        .accentColor(.orange)
                }
                
            }.listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
            
            
        }
    }
}

struct MakeMyMedication_Previews: PreviewProvider {
    static var previews: some View {
        MakeMyMedication()
    }
}
