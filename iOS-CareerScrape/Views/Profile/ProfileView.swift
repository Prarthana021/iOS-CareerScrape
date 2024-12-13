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
        NavigationView{
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            }
            
            else if let user = viewModel.user {
                VStack {
                    HStack(alignment: .center, spacing: 20){
                        VStack{
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                .shadow(radius: 2)
                                .padding(5)
                            Text("@\(user.username)").font(.headline).foregroundStyle(.primary).fontWeight(.bold)
                            
                            HStack{
                                Text("Admin").font(.subheadline).foregroundStyle(.gray).fontWeight(.bold)
                                if user.isAdmin{
                                    Image(systemName: "checkmark.seal.fill").foregroundStyle(.green)
                                }
                                else{
                                    Image(systemName: "xmark.circle.fill").foregroundStyle(.red)
                                }
                            }
                        }
                        VStack{
                            HStack(spacing: 40){
                                VStack{
                                    Text("Followers")
                                        .font(.subheadline).foregroundStyle(.gray)
                                    Text("\(user.followers.count)")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.primary)
                                }
                                VStack{
                                    Text("Following")
                                        .font(.subheadline).foregroundStyle(.gray)
                                    Text("\(user.following.count)").font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.primary)
                                }
                            }.padding()
                            if let users = viewModel.users {
                                NavigationLink(destination: UserListView(users: users))
                                {
                                    Text("Find Friends")
                                        .font(.headline)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.black)
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                        .shadow(radius: 5)
                                        .scaleEffect(1.1)
                                        .animation(.easeInOut, value: 1)
                                }
                            }
                        }
                        
                        
                        Spacer()
                    }
                    
                    
                    Text("Interested Job Roles").font(.title2).frame(maxWidth: .infinity, alignment: .leading).padding(15).fontWeight(.bold)
                    
                    if user.interestedJobs.isEmpty {
                        Text("No interested job roles available.")
                            .foregroundColor(.gray)
                            .italic()
                    } else {
                        List(user.interestedJobs, id: \.self) { job in
                            Text(job).padding(10)
                        }
                    }
                    Spacer()
                    
                    
                    Link(destination: URL(string: "http://s.com")!)
                    {
                        Text("Edit Profile")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                }
            }
            
        }.padding()
            .onAppear {
                print("User logged in state confirmed, fetching user data...")
                if authModel.isLoggedIn && viewModel.user == nil{
                    viewModel.fetchCurrentUser()
                    viewModel.fetchAllUsers()
                }
                //                viewModel.fetchCurrentUser()
                
                
            }
    }
}

struct Profile_View: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
