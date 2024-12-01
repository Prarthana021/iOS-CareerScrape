//
//  Job.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/28/24.
//
import Foundation

struct Job: Identifiable, Codable{
    var id:String
    var jobTitle: String
    var jobLink: String
    var jobLocation: String
    var companyName: String
    var jobType: String
    var companyDomain: String
    var jobLevel: String
    var companyLink:String
    var description: String
    var pulledDate: String
    var exactDate: String
    var jobPosted: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case jobTitle = "job_title"
        case jobLink = "job_link"
        case jobLocation = "job_location"
        case companyName = "company_name"
        case jobType = "job_type"
        case companyDomain = "company_domain"
        case jobLevel = "job_level"
        case companyLink = "company_link"
        case description
        case pulledDate = "pulled_date"
        case exactDate = "exact_date"
        case jobPosted = "job_posted"
    }
}

