//
//  SignupView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/30/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                // Set the entire background color to the container color
                Color(red: 245/255, green: 234/255, blue: 251/255) // #F5EAFB
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    // Container box for textfields and sign-up button
                    VStack(spacing: 20) {
                        // Sign Up title inside the container
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top, 20)
                        
                        // Username field
                        TextField("Username", text: $viewModel.username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                        // Email field
                        TextField("Email", text: $viewModel.email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .keyboardType(.emailAddress)
                        
                        // Password field
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        // Confirm Password field
                        SecureField("Confirm Password", text: $viewModel
                            .rePassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        
                        if viewModel.isLoading{
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .red))
                                .padding(.top, 20)
                        }
                        if let errorMessage = viewModel.errorMessage{
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding(.top, 20)
                        }
                        
                        // Sign Up button
                        Button(action: {
                            // Handle Sign Up action here
                            submit()
                        }) {
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    Color(red: 255/255, green: 183/255, blue: 178/255) // #FFB7B2
                                )
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        
                        // Log in with Google button
                        Button(action: {
                            // Handle Google login action here
                            print("login with google")
                        }) {
                            HStack {
                                Image("logogoogle") // Use the custom Google logo image from assets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 40)
                                
                                Text("Log in with Google")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 233/255, green: 216/255, blue: 223/255))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                        
                        // Already have an account? Sign In message
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.black)
                            NavigationLink(destination: LoginView()) {
                                Text("Sign In")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(20)
                    .frame(height: 650) // Increased height of the container
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 245/255, green: 234/255, blue: 251/255),  // #F5EAFB
                                Color(red: 254/255, green: 197/255, blue: 187/255),  // Light pink (#FEC5BB)
                                Color(red: 245/255, green: 235/255, blue: 224/255)   // Cream (#F5EBE0)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
            }
        }
    }
    func submit(){
        viewModel.singnup()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

