//
//  User.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/28/24.
//

struct User: Codable{
    let id: String
    
}

struct AuthUser: Codable{
    let email:String
    let isAdmin:Bool?
    let username:String
}
