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
            Tab(Constants.breakingBad, systemImage: "tortoise") {
                FetchView(show: Constants.breakingBad)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab(Constants.betterCallSaul, systemImage: "briefcase") {
                FetchView(show: Constants.betterCallSaul)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab(Constants.elCamino, systemImage: "car") {
                FetchView(show: Constants.elCamino)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
