//
//  Credits.swift
//  Meddie
//
//  Created by Michael Adams on 8/5/20.
//  Copyright © 2020 Michael Adams. All rights reserved.
//

import SwiftUI

struct Credits: View {
    var body: some View {
        
        List {
            
            Section {
                Text("App created by Michael Adams")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                Button(action: {
                    if let url = URL(string: "https://twitter.com/michdavidadams") {
                        UIApplication.shared.open(url)
                    }}) {
                        HStack {
                            Text("Twitter")
                            Spacer()
                            Image(systemName: "link")
                        }
                        
                }
                Button(action: {
                    if let url = URL(string: "https://www.instagram.com/michdavidadams/") {
                        UIApplication.shared.open(url)
                    }}) {
                        HStack {
                            Text("Instagram")
                            Spacer()
                            Image(systemName: "link")
                        }
                        
                }
            }
            Section {
                Text("Icon designed by Chandler Adams")
                    .font(.headline)
                    .foregroundColor(Color.green)
            }
            
        }.listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
    }
}

struct Credits_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
    }
}
