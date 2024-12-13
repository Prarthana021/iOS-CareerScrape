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
                Button(action: {
                    // Add action for user selection, e.g., view user profile
                    print("Selected \(user.username)")
                }) {
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

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView(users: [
//            User(username: "johndoe"),
//            User(username: "janedoe")
//        ])
//    }
//}
