//
//  MedicationsView.swift
//  Meddie
//
//  Created by Michael Adams on 7/30/20.
//  Copyright © 2020 Michael Adams. All rights reserved.
//

import SwiftUI

struct MedicationsHistoryView: View {
    static let timeFormat: DateFormatter = {
    let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
            return formatter
     }()
    static let dateFormat: DateFormatter = {
    let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
            return formatter
     }()
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Medications.entity(), sortDescriptors: [])
    
    // Fetches medications and makes them a variable
    var medications: FetchedResults<Medications>
    
    @State var showMakeMedication = false
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(medications.sorted(by: { ($0.dateTaken > $1.dateTaken)})) { medication in
                
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(medication.name)")
                                .font(.headline)
                            Text("Amount: \(medication.selectedAmount)")
                                .font(.subheadline)
                            
                        }.multilineTextAlignment(.leading)
                        VStack(alignment: .trailing) {
                            Text("\(medication.dateTaken, formatter: Self.dateFormat)")
                                .font(.subheadline)
                                
                            
                            Text("\(medication.timeTaken, formatter: Self.timeFormat)")
                                .font(.subheadline)
                                
                                
                        }.frame(maxWidth: .infinity, alignment: .trailing)
                            
                    }
                        
 
                }
                .onDelete {indexSet in
                    for index in indexSet {
                        self.managedObjectContext.delete(self.medications[index])
                    }
                }
                
                
            }.listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("History")
            .navigationBarItems(trailing: Button(action: {
                let impactMed = UIImpactFeedbackGenerator(style: .light)
                impactMed.impactOccurred()
                print("Open make medication")
                self.showMakeMedication = true;
            }, label: {
                Image(systemName: "plus.circle")
                .font(.system(size: 30, weight: .medium))
            }))
        }
        .sheet(isPresented: $showMakeMedication) {
            MakeMedication().environment(\.managedObjectContext, self.managedObjectContext)
        }
    }
}

struct MedicationsHistoryView_Preview: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return MedicationsHistoryView().environment(\.managedObjectContext, context)
    }
}
