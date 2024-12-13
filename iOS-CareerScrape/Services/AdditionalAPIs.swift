//
//  AdditionalAPIs.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/12/24.
//

import Foundation

// Fetch quotes with a completion handler
func fetchQuotes(completion: @escaping ([QuoteSchema]?) -> Void) {
    let urlString = "https://zenquotes.io/api/random"
    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        completion(nil)
        return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error fetching quotes: \(error)")
            completion(nil)
            return
        }

        guard let data = data else {
            print("No data received")
            completion(nil)
            return
        }

        do {
            let quotes = try JSONDecoder().decode([QuoteSchema].self, from: data)
            completion(quotes)
        } catch {
            print("Error decoding JSON: \(error)")
            completion(nil)
        }
    }.resume()
}
