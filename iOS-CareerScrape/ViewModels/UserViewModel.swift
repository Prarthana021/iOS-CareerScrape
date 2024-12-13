//
//  UserViewModel.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/28/24.
//
import Foundation

class UserViewModel: ObservableObject{
    @Published var user: User?
    @Published var users: [User]?
    @Published var error: Error?
    @Published var isLoading: Bool = false
    private let userService = UserService.shared
    
    func fetchCurrentUser(){
        isLoading = true
        error = nil
        
        userService.fetchCurrentUser(){ [weak self] result in
            DispatchQueue.main.async{
                self?.isLoading = false
                switch result{
                case .failure(let error):
                    self?.error = error
                case .success(let user):
                    self?.user = user
                }
            }
        }
    }
    
    func fetchAllUsers(){
        isLoading = true
        error = nil
        
        userService.fetchAllUsers{
            [weak self] result in
            
            DispatchQueue.main.async{
                self?.isLoading = false
                switch result {
                case .failure(let error):
                    self?.error = error
                case .success(let users):
                    self?.users = users
                }
            }
        }
    }
}
