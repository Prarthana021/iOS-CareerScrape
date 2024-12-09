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
    var body: some View {
        if viewModel.isLoading {
            ProgressView("Loading...")
        } else if let error = viewModel.error {
            Text("Error: \(error.localizedDescription)")
        }
        else{
            var followers = viewModel.user?.followers
            var followings = viewModel.user?.following
            var followersCount = followers?.count ?? 0
            var followingsCount = followings?.count ?? 0
            
            VStack {
                HStack{
                    VStack{
                        Text("Followers")
                        Text("\(followersCount)")
                    }
                    VStack{
                        Text("Following")
                        Text("\(followingsCount)")
                    }
                }
            }
            .padding()
            .onAppear {
                print("User logged in state confirmed, fetching user data...")
                if authModel.isLoggedIn && viewModel.user == nil{
                    viewModel.fetchCurrentUser()
                }
                
            }
        }
        
    }
}

struct Profile_View: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
