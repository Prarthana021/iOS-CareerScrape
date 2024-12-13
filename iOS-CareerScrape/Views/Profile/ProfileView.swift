//
//  ProfileView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/6/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = UserViewModel()
    @EnvironmentObject private var authModel: AuthViewModel
    @State var friendUser: User?
    //    @State var users: [User]
    var body: some View {
        NavigationView{
            if let friendUser = friendUser {
                ProfileDetailView(user: friendUser, viewModel: viewModel)
            }
            else if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            }
            else if let user = viewModel.user {
                ProfileDetailView(user: user, viewModel: viewModel)
            }
            
        }.padding()
            .onAppear {
                print("User logged in state confirmed, fetching user data...")
                if authModel.isLoggedIn && viewModel.user == nil {
                    viewModel.fetchCurrentUser()
                    viewModel.fetchAllUsers()
                }
                
            }
        
    }
}


struct Profile_View: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
