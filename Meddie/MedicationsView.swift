//
//  MedicationsView.swift
//  Meddie
//
//  Created by Michael Adams on 7/31/20.
//  Copyright © 2020 Michael Adams. All rights reserved.
//

import SwiftUI

struct MedicationsView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: MorningMedication().entity, sortDescriptors: [])
    var morningMedications: FetchedResults<MorningMedication>
    @FetchRequest(entity: AfternoonMedication().entity, sortDescriptors: [])
    var afternoonMedications: FetchedResults<AfternoonMedication>
    @FetchRequest(entity: EveningMedication().entity, sortDescriptors: [])
    var eveningMedications: FetchedResults<EveningMedication>
    @FetchRequest(entity: NightMedication().entity, sortDescriptors: [])
    var nightMedications: FetchedResults<NightMedication>
    @State var lastTaken = Date()
    
    static let timeFormat: DateFormatter = {
    let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
            return formatter
     }()
    @State var showMakeMyMedication = false
    var body: some View {
        NavigationView {
            List {
                
                // Morning medications
                Section(header:
                    HStack {
                        Image(systemName: "sunrise.fill").foregroundColor(.orange)
                        Text("Morning")
                    })
                {
                    ForEach(morningMedications) { morningMedication in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(morningMedication.name)")
                                    .font(.headline)
                                Text("Amount: \(morningMedication.numberToTake)")
                                    .font(.subheadline)
                                Text("Last taken \(morningMedication.lastTaken, formatter: Self.timeFormat)")
                                    .font(.subheadline)
                            }
                            Button(action: {
                                //let updateMorningMedication = MorningMedication(context: self.managedObjectContext)
                                morningMedication.lastTaken = Date()
                                do {
                                    try self.managedObjectContext.save()
                                    print("Medication saved.")
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }) {
                                Image(systemName: "checkmark.rectangle")
                                    .font(.system(size: 30, weight: .medium))
                                    .frame(alignment: .trailing)
                            }
                        }
                    }.onDelete { indexSet in
                        for index in indexSet {
                            self.managedObjectContext.delete(self.morningMedications[index])
                            
                        }
                    }
                }
                
                // Afternoon medications
                Section(header:
                    HStack {
                        Image(systemName: "sun.max.fill").foregroundColor(.orange)
                        Text("Afternoon")
                    })
                {
                    ForEach(afternoonMedications) { afternoonMedication in
                        VStack {
                            Text("\(afternoonMedication.name)")
                                .font(.headline)
                            Text("Amount: \(afternoonMedication.numberToTake)")
                                .font(.subheadline)
                            Text("Last taken \(afternoonMedication.lastTaken)")
                                .font(.subheadline)
                        }
                    }.onDelete { indexSet in
                        for index in indexSet {
                            self.managedObjectContext.delete(self.afternoonMedications[index])
                        }
                    }
                }
                
                // Evening medications
                Section(header:
                    HStack {
                        Image(systemName: "sun.haze.fill").foregroundColor(.orange)
                        Text("Evening")
                    })
                {
                    ForEach(eveningMedications) { eveningMedication in
                        VStack {
                            Text("\(eveningMedication.name)")
                                .font(.headline)
                            Text("Amount: \(eveningMedication.numberToTake)")
                                .font(.subheadline)
                            Text("Last taken \(eveningMedication.lastTaken)")
                                .font(.subheadline)
                        }
                    }.onDelete { indexSet in
                        for index in indexSet {
                            self.managedObjectContext.delete(self.eveningMedications[index])
                        }
                    }
                }
                
                // Night medications
                Section(header:
                    HStack {
                        Image(systemName: "moon.fill").foregroundColor(.orange)
                        Text("Night")
                    })
                {
                    ForEach(nightMedications) { nightMedication in
                        VStack {
                            Text("\(nightMedication.name)")
                                .font(.headline)
                            Text("Amount: \(nightMedication.numberToTake)")
                                .font(.subheadline)
                            Text("Last taken \(nightMedication.lastTaken)")
                                .font(.subheadline)
                        }
                    }.onDelete { indexSet in
                        for index in indexSet {
                            self.managedObjectContext.delete(self.nightMedications[index])
                        }
                    }
                }
                
                
                
            }.listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                .navigationBarTitle("Medications")
                .navigationBarItems(trailing: Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .light)
                    impactMed.impactOccurred()
                    print("Open make my medication")
                    self.showMakeMyMedication = true;
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 30, weight: .medium))
                        .accentColor(.orange)
                }))
        }
        .sheet(isPresented: $showMakeMyMedication) {
            MakeMyMedication().environment(\.managedObjectContext, self.managedObjectContext)
        }
    }
}

struct MedicationsView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return MedicationsView().environment(\.managedObjectContext, context)
    }
}
