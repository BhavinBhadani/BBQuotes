//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Bhavin Bhadani on 22/12/24.
//

import SwiftUI

struct QuoteView: View {
    
    let vm = ViewModel()
    let show: String
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: proxy.size.width * 2.7, height: proxy.size.height * 1.2)
                
                VStack {
                    Text("\"\(vm.quote.quote)\"")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black.opacity(0.50))
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.horizontal)
                    
                    ZStack(alignment: .bottom) {
                        AsyncImage(url: vm.character.images[0]) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .frame(width: proxy.size.width / 1.1, height: proxy.size.height / 1.8)
                    .clipShape(.rect(cornerRadius: 50))
                    
                    Text(vm.quote.character)
                }
                .frame(width: proxy.size.width)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
