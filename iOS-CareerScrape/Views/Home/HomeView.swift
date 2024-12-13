//
//  HomeView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/30/24.
//

import SwiftUI

struct HomeView: View{
    @EnvironmentObject private var viewModel: AuthViewModel
    @State private var selectedTab: Tab = .home
    @State private var isMenuOpen: Bool = false
    
    enum Tab{
        case home, profile, job
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab) {
                    
                    MainView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                        .tag(Tab.home)
                    JobView()
                        .tabItem{
                            Label("Jobs", systemImage: "cube.box")
                        }
                        .tag(Tab.job)
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.fill")
                        }
                        .tag(Tab.profile)
                    
                }
                
                // Menu overlay
                if isMenuOpen {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                isMenuOpen.toggle()
                            }
                        }
                    
                    SideMenuView(isMenuOpen: $isMenuOpen)
                        .transition(.move(edge: .leading))
                        .zIndex(1)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            isMenuOpen.toggle()
                        }
                    }) {
                        
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
    
    
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
