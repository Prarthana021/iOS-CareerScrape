//
//  AuthViewModel.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/30/24.
//
import Foundation

class AuthViewModel: ObservableObject {
    // Input fields
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var rePassword:String = ""
    @Published var isAdmin: Bool = false
    
    // State management
    @Published var isLoading: Bool = false
    @Published var errorMessage:String? = ""
    @Published var isLoggedIn: Bool = false
    @Published var isSignedUp: Bool = false
    
    
    func login(){
        guard !username.isEmpty, !password.isEmpty else{
            errorMessage="Username and password cannot be empty"
            return
        }
        isLoading=true
        AuthService.shared.login(username:username, password: password){
            [weak self] result in
            DispatchQueue.main.async{
                self?.isLoading = false
                switch result {
                case .success:
                    self?.isLoggedIn=true
                case .failure(let error):
                    self?.errorMessage=error.localizedDescription
                }
            }
        }
    }
    
    func singnup(){
        guard !username.isEmpty, !password.isEmpty, !rePassword.isEmpty, !email.isEmpty else{
            errorMessage="Username, email, and password cannot be empty"
            return
        }
        
        guard password==rePassword else{
            errorMessage = "Passwords should match"
            return
        }
        
        isLoading=true
        
        AuthService.shared.signup(username: username, email:email, password: password, isAdmin: isAdmin){
            [weak self] result in
            
            DispatchQueue.main.async{
                self?.isLoading=false
                switch result{
                case .success:
                    self?.isSignedUp=true
                case .failure(let error):
                    self?.errorMessage=error.localizedDescription
                }
            }
            
        }
    }
}
