//
//  SettingsView.swift
//  Meddie
//
//  Created by Michael Adams on 7/30/20.
//  Copyright © 2020 Michael Adams. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State public var isMorningToggle : Bool = true
    @State public var isAfternoonToggle : Bool = true
    @State public var isEveningToggle : Bool = true
    @State public var isNightToggle : Bool = true
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Show/Hide time of day tabs")) {
                    Toggle(isOn: $isMorningToggle) {
                        Text("Morning medications")
                    }
                    Toggle(isOn: $isAfternoonToggle) {
                        Text("Afternoon medications")
                    }
                    Toggle(isOn: $isEveningToggle) {
                        Text("Evening medications")
                    }
                    Toggle(isOn: $isNightToggle) {
                        Text("Night medications")
                    }
                }
                Section {
                    NavigationLink(destination: Help()) {
                        Image(systemName: "questionmark.circle")
                        Text("Help")
                    }
                    NavigationLink(destination: Credits()) {
                        Image(systemName: "heart.circle")
                        Text("Credits")
                    }
                }
                
            }.listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                .navigationBarTitle("Settings")
                .accentColor(.orange)
        }
    }
    func showCredits() {
        print("Show credits")
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
