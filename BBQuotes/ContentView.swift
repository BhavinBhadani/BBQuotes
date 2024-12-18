//
//  ContentView.swift
//  BBQuotes
//
//  Created by Bhavin Bhadani on 18/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Breakig Bad", systemImage: "tortoise") {
                Text("Breaking Bad View")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Better call Saul", systemImage: "briefcase") {
                Text("Better call Saul View")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
