//
//  User.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/28/24.
//

struct User: Identifiable, Codable {
    let id: String
    let username: String
    let email: String
    let followers: [String]
    let following: [String]
    let interestedJobs: [String]
    let isAdmin: Bool

    // Map JSON fields to the `User` properties
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case followers
        case following
        case interestedJobs
        case isAdmin
    }
}

struct AuthUser: Codable{
    let email:String
    let isAdmin:Bool?
    let username:String
}
