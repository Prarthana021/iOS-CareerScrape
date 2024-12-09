//
//  HomeView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/30/24.
//

import SwiftUI

struct HomeView: View{
    @EnvironmentObject private var viewModel: AuthViewModel
    var body: some View{
        if viewModel.isLoggedIn{
            JobView()
        }
        else{
            LoginView()
        }
        
        
    }
    
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AuthViewModel())
    }
}
