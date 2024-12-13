//
//  UserListView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/13/24.
//
import SwiftUI

struct UserListView: View {
    let users: [User]
    
    var body: some View {
        VStack {
            Text("Find Friends")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            List(users) { user in
                NavigationLink(destination: ProfileView(friendUser: user)) {
                    HStack {
                        Text("@\(user.username)")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle()) // Ensures no default button styling
            }
            .listStyle(PlainListStyle()) // Removes default list styling
            .padding(.horizontal)
        }
        .padding()
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(users: [
            User(id: "123e4567-e89b-12d3-a456-426614174000",
                 username: "dummyuser",
                 email: "dummyuser@example.com",
                 //                 password: "dummyPassword123",
                 followers: [],
                 following: [],
                 interestedJobs: [],
                 isAdmin: false
                ),
            User(id: "987e6543-e21c-45d3-b321-789012345678",
                 username: "testuser",
                 email: "testuser@example.com",
                 //                 password: "securePassword321",
                 followers: ["123e4567-e89b-12d3-a456-426614174000"],
                 following: [],
                 interestedJobs: ["Software Engineer", "Data Scientist"],
                 isAdmin: true
                )
        ])
    }
}
