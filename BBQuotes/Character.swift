//
//  Character.swift
//  BBQuotes
//
//  Created by Bhavin Bhadani on 19/12/24.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let status: String
    let portrayedBy: String
}
