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
            Tab("Breaking Bad", systemImage: "tortoise") {
                QuoteView(show: "Breaking Bad")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Better call Saul", systemImage: "briefcase") {
                QuoteView(show: "Better Call Saul")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
