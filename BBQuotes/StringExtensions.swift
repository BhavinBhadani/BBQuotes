//
//  StringExtensions.swift
//  BBQuotes
//
//  Created by Bhavin Bhadani on 24/12/24.
//

import Foundation

extension String {
    func removeSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpace() -> String {
        self.removeSpaces().lowercased()
    }
}
