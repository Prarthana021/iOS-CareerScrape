//
//  APIResponse.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/28/24.
//

import Foundation


struct QuoteSchema: Decodable{
    var q:String
    var a:String
    var h:String
    
}

typealias Quote = [QuoteSchema]
