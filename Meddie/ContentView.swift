//
//  ContentView.swift
//  Meddie
//
//  Created by Michael Adams on 7/24/20.
//  Copyright © 2020 Michael Adams. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Medications.entity(), sortDescriptors: [])
    
    var medications: FetchedResults<Medications>
    
    @State var showMakeMedication = false
    
    
    
    var body: some View {
        
        TabView {
            MedicationsView()
                .tabItem {
                    Image(systemName: "bandage.fill").imageScale(.large)
                    Text("Medications")
                        .fontWeight(.bold)
            }
            MedicationsHistoryView()
                .tabItem {
                    Image(systemName: "clock.fill").imageScale(.large)
                    Text("History")
                        .fontWeight(.bold)
                    
            }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear").imageScale(.large)
                    Text("Settings")
                        .fontWeight(.bold)
            }
        }
        .accentColor(.orange)
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return ContentView().environment(\.managedObjectContext, context)
    }
}
