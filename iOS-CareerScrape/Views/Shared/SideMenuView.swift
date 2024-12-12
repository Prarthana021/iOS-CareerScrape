//
//  SideMenuView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/12/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isMenuOpen: Bool
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Button(action: {
                withAnimation {
                    isMenuOpen = false
                }
            }) {
                Text("Close Menu")
                    .padding()
            }
            
            Divider()
            
            Button(action:{authViewModel.logOut()}) {
                Text("Logout")
                    .padding()
            }
            
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(10)
//                .shadow(radius: 5)
        .edgesIgnoringSafeArea(.vertical)
        .padding()
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isMenuOpen: .constant(false)) // Provide a constant binding
    }
}
