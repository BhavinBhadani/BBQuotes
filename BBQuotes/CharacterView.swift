//
//  CharacterView.swift
//  BBQuotes
//
//  Created by Bhavin Bhadani on 23/12/24.
//

import SwiftUI

struct CharacterView: View {
    let character: Character
    let show: String
    
    var body: some View {
        GeometryReader { proxy in
            ScrollViewReader { scrollProxy in
                ZStack(alignment: .top) {
                    Image(show.removeCaseAndSpace())
                        .resizable()
                        .scaledToFit()
                    
                    ScrollView {
                        TabView {
                            ForEach(character.images, id: \.self) { chracterImageURL in
                                AsyncImage(url: chracterImageURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                        .tabViewStyle(.page)
                        .frame(width: proxy.size.width / 1.2, height: proxy.size.height / 1.7)
                        .clipShape(.rect(cornerRadius: 24))
                        .padding(.top, 60)

                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.largeTitle)

                            Text("Portrayed by: \(character.portrayedBy)")
                                .font(.subheadline)
                            
                            Divider()
                            
                            Text("\(character.name) Character Info")
                                .font(.title2)
                            
                            Text("Born: \(character.birthday)")
                            
                            Divider()
                            
                            Text("Occupations:")
                            
                            ForEach(character.occupations, id: \.self) { occupation in
                                Text("•\(occupation)")
                                    .font(.headline)
                            }
                            
                            Divider()
                            
                            Text("Nicknames:")

                            if !character.aliases.isEmpty {
                                ForEach(character.aliases, id: \.self) { alias in
                                    Text("•\(alias)")
                                        .font(.headline)
                                }
                            } else {
                                Text("None")
                                    .font(.headline)
                            }
                            
                            Divider()
                            
                            DisclosureGroup("Status (Spoiler Alert!)") {
                                VStack(alignment: .leading) {
                                    Text(character.status)
                                        .font(.title2)
                                        .multilineTextAlignment(.leading)
                                    
                                    if let death = character.death {
                                        AsyncImage(url: death.image) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .clipShape(.rect(cornerRadius: 16))
                                                .onAppear {
                                                    withAnimation {
                                                        scrollProxy.scrollTo(1, anchor: .bottom)
                                                    }
                                                }
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        Text("How: \(death.details)")
                                            .padding(.bottom, 8)
                                        
                                        Text("Last Words: \"\(death.lastWords)\"")
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .tint(.primary)
                        }
                        .frame(width: proxy.size.width / 1.25, alignment: .leading)
                        .padding(.bottom, 50)
                        .id(1)
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView(character: ViewModel().character, show: Constants.breakingBad)
        .preferredColorScheme(.dark)
}
