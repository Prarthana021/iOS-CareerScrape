//
//  ContentView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 10/11/24.
//

import SwiftUI
// TODO: search_user, saved_jobs, follow and following feature and logo in pages &&&& load db
// TODO: future things .....
struct ContentView: View {
    @EnvironmentObject var authModel: AuthViewModel
    @EnvironmentObject private var viewModel: AuthViewModel
    var body: some View {
        Group{
            if authModel.isLoggedIn{
                  HomeView()
            }
            else{
                LoginView()
            }
        }.onAppear{
            print("auth please...", authModel.isLoggedIn)
        }
    }
}



#Preview {
    
    ContentView().environmentObject(AuthViewModel())
}
