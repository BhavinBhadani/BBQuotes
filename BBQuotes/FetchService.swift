//
//  FetchService.swift
//  BBQuotes
//
//  Created by Bhavin Bhadani on 20/12/24.
//

import Foundation

struct FetchService {
    
    private enum FetchError: Error {
        case badResponse
    }
    
    private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    func fetchQuote(from show: String) async throws -> Quote {
        let quoteURL = baseURL.appending(path: "quotes/random")
        let fetchURL = quoteURL.appending(queryItems: [
            URLQueryItem(name: "production", value: show)
        ])
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        return quote
    }
    
    func fetchCharacter(from name: String) async throws -> Character {
        let charcterURL = baseURL.appending(path: "characters")
        let fetchURL = charcterURL.appending(queryItems: [
            URLQueryItem(name: "name", value: name)
        ])
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let characters = try decoder.decode([Character].self, from: data)
        return characters[0]
    }

    func fetchDeath(from character: String) async throws -> Death? {
        let deathURL = baseURL.appending(path: "deaths")
        let (data, response) = try await URLSession.shared.data(from: deathURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let deaths = try decoder.decode([Death].self, from: data)
        return deaths.first(where: { $0.character == character })
    }

}
