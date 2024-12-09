//
//  iOS_CareerScrapeApp.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 10/11/24.
//

import SwiftUI

@main
struct iOS_CareerScrapeApp: App {
    @StateObject private var authModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authModel)
        }
    }
}
