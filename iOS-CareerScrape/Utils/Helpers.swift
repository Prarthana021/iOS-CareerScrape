//
//  Helpers.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/28/24.
//

import Foundation

func formatDate(_ isoString: String) -> String?{
    let isoFormatter = ISO8601DateFormatter()
    guard let date = isoFormatter.date(from: isoString) else {
        return nil
    }
    let customDateFormatter = DateFormatter()
    customDateFormatter.dateFormat = "MM-dd-yy hh:mm a"
    customDateFormatter.timeZone = TimeZone(abbreviation: "EST")
    
    return customDateFormatter.string(from: date)
    
}
